class StepsController < InheritedResources::Base
  belongs_to :course

  before_action :set_variables, only: [:show]

  def show
  end

  private

  def set_variables
    @step = Step.find(params[:id])
    @course = @step.course
    @course_progress = CourseProgress.where(user:current_user, course: @course).first
    @step_progress = StepProgress.find_or_create_by(course_progress_id:@course_progress.id, step_id: @step.id)
  end

end
