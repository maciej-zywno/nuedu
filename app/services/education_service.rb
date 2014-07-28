class EducationService

  def self.start_course(user, course)
    progress = CourseProgress.create!(user: current_user, course: course)
    progress.next_video = course.steps.first.videos.first
    progress.save!
  end

  def self.video_watched(video, user)
    course_progress = CourseProgress.where(user:user, course:video.course).first
    @step_progress = StepProgress.find_or_create_by(course_progress_id:course_progress.id, step_id: video.step.id)
    @step_progress.watched_videos << video unless @step_progress.watched_videos.include? video

    course_progress.last_video = video
    next_video = video.step.videos.where(position: (video.position + 1)).first

    unless next_video
      next_step = video.course.steps.where(position: (video.step.position + 1)).first
      next_video  = next_step.videos.first if next_step
    end

    course_progress.next_video = next_video
    course_progress.save

    if video.exam
      :video_related_exam
    elsif video.step.next_video(video)
      :video
    elsif video.step.exam
      :step_exam
    elsif video.course.next_step(video.step)
      complete_step
      :next_step
    else
      complete_step
      :finished
    end
  end

  def self.next
  end

  def self.exam_taken(data, user)
    exam = Exam.find(data['exam_id'])
    course_progress = CourseProgress.where(user:user, course:exam.course).first
    @step_progress = course_progress.step_progresses.where(step: exam.step).first
    exam_progress = @step_progress.exam_progresses.create!(exam: exam)
    data['questions'].each do |question, answers|
      qr = QuestionResult.create(exam_progress: exam_progress, question: Question.find(question.to_i))
      unless answers.empty?
        answers.each do |answer|
          qr.answers.create(answer: Answer.find(answer))
        end
      end
    end

    if exam.step.next_video_after_exam(exam)
      :video
    elsif exam.step.exam
      :step_exam
    elsif exam.course.next_step(exam.step)
      complete_step
      :next_step
    else
      complete_step
      :finished
    end


  end

  private
  def complete_step
    @step_progress.complete = true
    @step_progress.save!
  end
end
