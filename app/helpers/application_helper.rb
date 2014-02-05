module ApplicationHelper

  def teacher?
    current_user.has_role? :teacher
  end

  def admin?
    current_user.has_role? :admin
  end

  def new_upload_video_info(step)
    Video.token_form("#{step.course.name}-#{step.name}-#{step.id}", save_new_teacher_course_step_video_url(step.course, step) )
  end

end
