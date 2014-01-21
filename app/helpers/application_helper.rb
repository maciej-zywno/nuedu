module ApplicationHelper

  def teacher?
    current_user.has_role? :teacher
  end

  def admin?
    current_user.has_role? :admin
  end


end
