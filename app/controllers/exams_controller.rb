class ExamsController < InheritedResources::Base
  respond_to :js

  def finish
    data = JSON.parse(params[:data].gsub("'",""))
    case EducationService.exam_taken(data, current_user)
    when :video

    when :step_exam

    when :next_step

    when :finished

    end
  end

end
