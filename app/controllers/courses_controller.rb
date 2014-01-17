class CoursesController < InheritedResources::Base
  load_and_authorize_resource
  after_action :add_moderator_role, only: [:create]


  private

  def add_moderator_role
    current_user.add_role(:moderator, @course)
  end

  def permitted_params
    params.permit(:course => [:name, :description])
  end
end
