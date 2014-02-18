class VideosController < ApplicationController
  before_action :set_variables

  def play
  end

  def watched
    case EducationService.video_watched(@video, current_user)
    when :video_related_exam
      @exam = @video.exam
      render '/exams/show'
    when :video
      @video = @video.step.next_video_after_exam(@exam)
      render '/videos/play'
    when :step_exam

    when :next_step

    when :finished


    end
  end

  private

  def set_variables
    @video = Video.find(params[:id]);
  end

end
