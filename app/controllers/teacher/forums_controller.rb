module Teacher
  class ForumsController < ApplicationController
    before_action :set_course

    def attach
      @forum = @course.forum || Forum.create!(course: @course)
      render 'show'
    end

    def show
      @forum = Forum.find params[:id]
    end


    private
    def set_course
      @course = Course.find(params[:course_id])
    end

  end
end
