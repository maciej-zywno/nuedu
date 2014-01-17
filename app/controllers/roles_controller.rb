class RolesController < ApplicationController
  before_filter :authenticate_user!

  def add_role
    current_user.add_role params[:role].to_sym  if user_signed_in?
    redirect_to root_path, notice: "You are now a #{params[:role]}"
  end


  def remove_role
    current_user.remove_role params[:role].to_sym  if user_signed_in?
    redirect_to root_path, notice:"You are now no longer a #{params[:role]}"
  end

end
