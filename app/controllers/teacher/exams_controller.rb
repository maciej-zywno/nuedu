module Teacher
  class ExamsController < ApplicationController
    before_action :set_exam, only: [:show, :edit, :update, :destroy]
    before_action :set_variables, only: [:new, :create, :edit, :destroy]

    # GET /exams
    # GET /exams.json
    def index
      @exams = Exam.all
    end

    # GET /exams/1
    # GET /exams/1.json
    def show
    end

    # GET /exams/new
    def new
      @exam = Exam.new
    end

    def create
      if current_user.has_role?(:moderator, @course)
        @exam = Exam.new(exam_params)
        @exam.examable = @video
        @exam.save
      else

      end

    end

    # GET /exams/1/edit
    def edit
    end

    # PATCH/PUT /exams/1
    # PATCH/PUT /exams/1.json
    def update
      @exam.update(exam_params)
    end

    # DELETE /exams/1
    # DELETE /exams/1.json
    def destroy
      @exam.destroy
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam
      @exam = Exam.find(params[:id])
    end

    def set_variables
      @course = Course.find(params[:course_id])
      @step = Step.find(params[:step_id]) if params[:step_id]
      @video = Video.find(params[:video_id]) if params[:video_id]
    end

    def exam_params
      params.require(:exam).permit!
    end

  end
end
