module Teacher
  class AnnouncementsController < ApplicationController
    before_action :set_announcement, only: [:show, :edit, :update, :destroy]
    before_action :set_course
    # GET /announcements
    # GET /announcements.json
    def index
      @announcements = Announcement.where(course_id: params[:course_id])

    end

    # GET /announcements/1
    # GET /announcements/1.json
    def show
    end

    # GET /announcements/new
    def new
      @announcement = Announcement.new(course_id:params[:course_id])
    end

    # GET /announcements/1/edit
    def edit
    end

    # POST /announcements
    # POST /announcements.json
    def create
      @announcement = Announcement.new(announcement_params)
      @announcement.course_id = params[:course_id]

      respond_to do |format|
        if @announcement.save
          format.html { redirect_to edit_teacher_course_path(@course), notice: 'announcement was successfully created.' }
        else
          format.html { render action: 'new' }
        end
      end
    end

    # PATCH/PUT /announcements/1
    # PATCH/PUT /announcements/1.json
    def update
      respond_to do |format|
        if @announcement.update(announcement_params)
          format.html { redirect_to edit_teacher_course_path(@course), notice: 'announcement was successfully updated.' }
        else
          format.html { render action: 'edit' }
        end
      end
    end

    # DELETE /announcements/1
    # DELETE /announcements/1.json
    def destroy
      @announcement.destroy
      redirect_to edit_teacher_course_announcement_path(@course)
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_announcement
      @announcement = Announcement.find(params[:id])
    end

    def set_course
      @course = Course.find(params[:course_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def announcement_params
      params.require(:announcement).permit(:title, :content)
    end
  end
end
