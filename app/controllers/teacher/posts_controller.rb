module Teacher
  class PostsController < ApplicationController

    before_action :set_variables
    before_action :set_post, only: [:show, :edit, :update, :destroy]

    def new
      @post = Post.new
    end

    def create
      @post = @topic.posts.build(post_params)
      @post.user = current_user

      if @post.save
        flash[:notice] = "Post was successfully created."
        redirect_to teacher_course_forum_topic_path(@course, @forum, @post.topic)
      else
        render :action => 'new'
      end
    end

    def edit
    end

    def update
      if @post.update_attributes(post_params)
        flash[:notice] = "Post was successfully updated."
        redirect_to teacher_course_forum_topic_path(@course, @forum, @post.topic)
      end
    end

    def destroy
      if @post.topic.posts_count > 1
        if @post.destroy
          flash[:notice] = "Post was successfully destroyed."
          redirect_to teacher_course_forum_topic_path(@course, @forum, @post.topic)
        end
      else
        if @post.topic.destroy
          flash[:notice] = "Topic was successfully deleted."
          redirect_to teacher_course_forum_path(@course, @forum)
        end
      end
    end

    private

    def post_params
      params.require(:post).permit(:body)
    end

    def set_variables
      @course = Course.find(params[:course_id])
      @forum = Forum.find(params[:forum_id])
      @topic = Topic.find(params[:topic_id])
    end

    def set_post
      @post = Post.find(params[:id])
    end

  end
end
