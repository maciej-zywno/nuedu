class VideosController < ApplicationController
  before_action :set_variables

  def play
  end

  def finish
    EducationService.video_watched(@video)
    EducationService.next

    if @video.exam
      @exam = @video.exam
      render '/exams/show'
    else
    end
  end

  private

  def set_variables
    @video = Video.find(params[:id]);
    @step = Step.find(params[:step_id]);
    @course = Course.find(params[:course_id]);
  end

end
