class CoursesController < InheritedResources::Base

  before_action :set_course, only: [ :enroll]

  def intro
  end

  def enroll
    if @course.participants.include? current_user
      redirect_to @course, notice: 'You are already enrolled!'
    else
      @course.participations.create(user: current_user)
      current_user.add_role :participant, @course
      redirect_to @course, notice: 'You have successfully enrolled!'
    end
  end

  private
  def set_course
    @course = Course.find(params[:id])
  end


end
