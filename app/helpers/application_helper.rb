module ApplicationHelper

  def teacher?
    current_user.has_role? :teacher
  end

  def student?
    if current_user
      current_user.has_role? :student
    else
      false
    end
  end

  def course_progress(course)
    @course_progress ||= CourseProgress.where(user:current_user, course: course).first
  end

  def step_progress(step)
    StepProgress.find_or_create_by(course_progress_id:course_progress(step.course).id, step_id: step.id)
  end

  def next_video_path(step_progress)
    play_video_path(step_progress.step.next_video(step_progress.watched_videos.last)) if step_progress.step.next_video(step_progress.watched_videos.last)
  end

  def next_step_path(course)
    step_progress =  course_progress(course).step_progresses.incompleted.first
    if step_progress
      step = step_progress.step
    else
      # when there is no step progress yet
      step = course.steps.first
    end

    course_step_path(course,step)

  end

  def enrolled?(course)
    course.participants.include? current_user
  end

  def moderator?(course)
    current_user.has_role? :moderator, course
  end

  def admin?
    current_user.has_role? :admin
  end

  def cms_admin?
    current_user.has_role? :cms_admin
  end



  def new_upload_video_info(step)
    Video.token_form("#{step.course.name}-#{step.name}-#{step.id}", save_new_teacher_course_step_video_url(step.course, step) )
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end


  private
end
