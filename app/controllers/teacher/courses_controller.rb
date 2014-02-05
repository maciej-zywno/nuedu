module Teacher
  class CoursesController  < ApplicationController
    load_and_authorize_resource

    skip_load_resource only: [:create]

    after_action :add_moderator_role, only: [:create]
    # before_action :set_course, only: [:show, :edit, :update, :destroy]

    # GET /courses
    # GET /courses.json
    def index
      @courses = Course.with_role(:moderator, current_user)
      @videos = Video.with_role(:moderator, current_user)
    end

    def publish
      @course.status = "PUBLISHED"
      @course.save
      redirect_to edit_teacher_course_path(@course), notice: 'Course was successfully published.'
    end

    def draft
      @course.status = "DRAFT"
      @course.save
      redirect_to edit_teacher_course_path(@course), notice: 'Course was successfully unpublished.'
    end

    # GET /courses/1
    # GET /courses/1.json
    def show
    end

    # GET /courses/new
    def new
      @course = Course.new
    end

    # GET /courses/1/edit
    def edit
    end

    # POST /courses
    # POST /courses.json
    def create
      @course = Course.new(course_params)
      respond_to do |format|
        if @course.save
          format.html { redirect_to edit_teacher_course_path(@course), notice: 'Course was successfully created.' }
          format.json { render action: 'show', status: :created, location: @course }
        else
          format.html { render action: 'new' }
          format.json { render json: @course.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /courses/1
    # PATCH/PUT /courses/1.json
    def update
      respond_to do |format|
        if @course.update(course_params)
          format.html { redirect_to [:teacher, @course], notice: 'Course was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @course.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /courses/1
    # DELETE /courses/1.json
    def destroy
      @course.destroy
      respond_to do |format|
        format.html { redirect_to teacher_courses_url }
        format.json { head :no_content }
      end
    end

    private

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:name, :description, :category_id)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    def add_moderator_role
      current_user.add_role(:moderator, @course) if @course.persisted?
    end


  end
end
