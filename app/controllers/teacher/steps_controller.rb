module Teacher
  class StepsController < ApplicationController
    before_action :set_step, only: [:show, :edit, :update, :destroy]

    # GET /steps
    # GET /steps.json
    def index
      @steps = Step.all
    end

    # GET /steps/1
    # GET /steps/1.json
    def show
    end

    # GET /steps/new
    def new
      @step = Step.new(course_id:params[:course_id])
    end

    # GET /steps/1/edit
    def edit
    end

    # POST /steps
    # POST /steps.json
    def create
      @step = Step.new(step_params)
      @step.course_id = params[:course_id]

      respond_to do |format|
        if @step.save
          format.html { redirect_to edit_teacher_course_step_path(@step.course, @step), notice: 'Step was successfully created.' }
        else
          format.html { render action: 'new' }
        end
      end
    end

    # PATCH/PUT /steps/1
    # PATCH/PUT /steps/1.json
    def update
      respond_to do |format|
        if @step.update(step_params)
          format.html { redirect_to edit_teacher_course_step_path(@step.course, @step), notice: 'Step was successfully updated.' }
        else
          format.html { render action: 'edit' }
        end
      end
    end

    # DELETE /steps/1
    # DELETE /steps/1.json
    def destroy
      @step.destroy
      redirect_to edit_teacher_course_step_path(@course)
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_step
      @step = Step.find(params[:id])
      @course = @step.course
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def step_params
      params.require(:step).permit(:name, :description)
    end
  end
end
