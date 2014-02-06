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

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end
end
