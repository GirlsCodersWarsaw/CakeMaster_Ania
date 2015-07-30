class CakeAttachmentsController < ApplicationController
  before_action :set_cake_attachment, only: [:show, :edit, :update, :destroy]

  # GET /cake_attachments
  # GET /cake_attachments.json
  def index
    @cake_attachments = CakeAttachment.all
  end

  # GET /cake_attachments/1
  # GET /cake_attachments/1.json
  def show
  end

  # GET /cake_attachments/new
  def new
    @cake_attachment = CakeAttachment.new
  end

  # GET /cake_attachments/1/edit
  def edit
  end

  # POST /cake_attachments
  # POST /cake_attachments.json
  def create
    @cake_attachment = CakeAttachment.new(cake_attachment_params)

    respond_to do |format|
      if @cake_attachment.save
        format.html { redirect_to @cake_attachment, notice: 'Cake attachment was successfully created.' }
        format.json { render :show, status: :created, location: @cake_attachment }
      else
        format.html { render :new }
        format.json { render json: @cake_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cake_attachments/1
  # PATCH/PUT /cake_attachments/1.json
  def update
    respond_to do |format|
      if @cake_attachment.update(cake_attachment_params)
        format.html { redirect_to @cake_attachment, notice: 'Cake attachment was successfully updated.' }
        format.json { render :show, status: :ok, location: @cake_attachment }
      else
        format.html { render :edit }
        format.json { render json: @cake_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cake_attachments/1
  # DELETE /cake_attachments/1.json
  def destroy
    @cake_attachment.destroy
    respond_to do |format|
      format.html { redirect_to cake_attachments_url, notice: 'Cake attachment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cake_attachment
      @cake_attachment = CakeAttachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cake_attachment_params
      params.require(:cake_attachment).permit(:cake_id, :image, :remove_image )
    end
end
