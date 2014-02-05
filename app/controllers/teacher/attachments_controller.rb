module Teacher
  class AttachmentsController < ApplicationController
    before_action :set_attachment, only: [:show, :edit, :update, :destroy]
    before_action :set_variables, only: [:create]

    # GET /attachments
    # GET /attachments.json
    def index
      @attachments = Attachment.all
    end

    # GET /attachments/1
    # GET /attachments/1.json
    def show
    end

    # GET /attachments/new
    def new
      @attachment = Attachment.new
    end

    # GET /attachments/1/edit
    def edit
    end

    # POST /attachments
    # POST /attachments.json
    def create

      if current_user.has_role(:moderator, @course)
        @attachment = Attachment.new
        @attachment.url = params[:url]
        @attachment.file_file_name = params[:filename]
        @attachment.file_content_type = params[:filetype]
        @attachment.file_file_size = params[:filesize]
        @attachment.file_updated_at = params[:lastModifiedDate]
        @attachment.unique_id = params[:unique_id]
        @attachment.s3_filepath = params[:filepath]
        @attachment.attachable = @step ? @step : @course
        @attachment.save
      else

      end

    end

    # PATCH/PUT /attachments/1
    # PATCH/PUT /attachments/1.json
    def update
      respond_to do |format|
        if @attachment.update(attachment_params)
          format.html { redirect_to @attachment, notice: 'Attachment was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @attachment.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /attachments/1
    # DELETE /attachments/1.json
    def destroy
      @attachment.destroy
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_attachment
      @attachment = Attachment.find(params[:id])
    end

    def set_variables
      @course = Course.find(params[:course_id])
      @step = Step.find(params[:step_id]) if params[:step_id]
    end


  end
end
