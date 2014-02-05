module Teacher
  class VideosController < ApplicationController
    load_and_authorize_resource
    
    skip_load_resource only: [:save]
    
    before_action :set_variables, only: [:save, :destroy]
    after_action :add_moderator_role, only: [:upload]

    # def index
    #   @videos = Video.with_role(:moderator, current_user)
    # end

    def new
    end


    def save
      if params[:status].to_i == 200
        @video = Video.new
        @video.step = @step
        @video.yt_id = params[:id].to_s
        @video.complete  = true
        @video.save
      end

      redirect_to edit_teacher_course_step_path(@course, @step), :notice => "video successfully uploaded"
    end

    def destroy
      @video = Video.find(params[:id])
      if Video.delete_video(@video)
        flash[:notice] = "video successfully deleted"
      else
        flash[:error] = "video unsuccessfully deleted"
      end
      redirect_to :back, status: :see_other
    end


    protected
    def collection
      @videos ||= end_of_association_chain.complete
    end

    private
    def video_params
      puts params.inspect
      params.require(:video).permit(:title, :description)
    end


    def add_moderator_role
      current_user.add_role(:moderator, @video) if @video.persisted?
    end

    def set_variables
      @course = Course.find(params[:course_id])
      @step = Step.find(params[:step_id])
    end

  end
end
