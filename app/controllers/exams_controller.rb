class ExamsController < InheritedResources::Base

  def finish
    data =  params[:data]
    puts data
    data = JSON.parse data.gsub("'","")
    puts data

    exam_progress = ExamProgress.create(exam: Exam.find(data['exam_id']))
    data['questions'].each do |question, answers|
      qr = QuestionResult.create(exam_progress: exam_progress, question: Question.find(question.to_i))
      unless answers.empty?
        answers.each do |answer|
          qr.answers.create(answer: Answer.find(answer))
        end
      end
    end
    EducationService.exam_taken(exam_progress)
  end

end
