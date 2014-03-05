module CmsDeviseAuth
  def authenticate
    unless current_user && current_user.has_role?(:cms_admin)
      redirect_to root_path
    end
  end
end