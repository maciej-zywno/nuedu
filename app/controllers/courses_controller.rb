class CoursesController < InheritedResources::Base
  load_and_authorize_resource

  before_action :set_course, only: [ :enroll]
  before_action :set_course_progress, only: [:show, :announcements, :forum]
  def intro
  end

  def index
    if params[:q]
      @courses = Course.search(params[:q]).records.records
    else
      @courses = Category.where(id: params[:category]).first.courses if params[:category]
    end
  end

  def enroll
    if @course.participants.include? current_user
      redirect_to @course, notice: 'You are already enrolled!'
    else
      @course.participations.create!(user: current_user)
      CourseProgress.create!(user: current_user, course: @course)
      current_user.add_role :participant, @course
      redirect_to @course, notice: 'You have successfully enrolled!'
    end
  end

  def announcements
  end

  def forum
  end

  private
  def set_course
    @course = Course.find(params[:id])
  end

  def set_course_progress
    @course_progress =   CourseProgress.where(user:current_user, course: @course).first || CourseProgress.create!(user: current_user, course: @course) if current_user
  end

end
