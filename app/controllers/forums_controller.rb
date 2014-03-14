class ForumsController < ApplicationController
  before_action :set_course

  def show
    @forum = @course.forum
  end

  private
  def set_course
    @course = Course.find(params[:course_id])
  end
end
