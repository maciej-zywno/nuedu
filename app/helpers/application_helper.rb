module ApplicationHelper

  def teacher?
    current_user.has_role? :teacher
  end

end
