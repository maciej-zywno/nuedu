module Teacher
  class TopicsController < ApplicationController

    before_action :set_variables
    before_action :set_topic, only: [:show, :edit, :update, :destroy]

    def show
    end

    def new
      @topic = Topic.new
    end

    def edit
    end

    def update
      if @topic.update_attributes(topic_params)
        flash[:notice] = "Topic was updated successfully."
        redirect_to teacher_course_forum_topic_url(@course, @forum, @topic)
      end
    end

    def destroy
      if @topic.destroy
        flash[:notice] = "Topic was deleted successfully."
        redirect_to teacher_coruse_forum_url(@course, @forum)
      end
    end

    def create
      @forum = Forum.find(params[:forum_id])
      @topic = @forum.topics.build(topic_params)
      @topic.user = current_user

      if @topic.save
        flash[:notice] = "Topic was successfully created."
        redirect_to teacher_course_forum_topic_url(@course, @forum, @topic)
      else
        render :action => 'new'
      end
    end

    private

    def topic_params
      params.require(:topic).permit(:title, :body, :sticky, :locked)
    end

    def set_variables
      @course = Course.find(params[:course_id])
      @forum = Forum.find(params[:forum_id])
    end

    def set_topic
      @topic = Topic.find(params[:id])
    end

  end
end
