class CakesController < ApplicationController

  def index
    @cakes = Cake.all
  end

  # def show
  #  @cake_attachments = @cake.cake_attachments.all
  # end

  def new
    @cake = Cake.new
    @cake_attachment = @cake.cake_attachments.build
  end

  def create
    @cake = Cake.new cake_params
    if @cake.save
      params[:cake_attachments]['image'].each do |img|
        @cake_attachment = @cake.cake_attachments.create!(:image => img)
      end
      flash[:notice] = "Gratulacje! Dodałeś ciasto."
      redirect_to root_path
    else
      flash.now[:alert] = "Wypełnij wszystkie pola."
      render action: "new"
    end
  end

  def edit
    @cake = Cake.find(params[:id])
  end

  def update
    @cake = Cake.find(params[:id])
    if @cake.update(cake_params)
      params[:cake_attachments]['image'].each do |img|
        @cake_attachment = @cake.cake_attachments.create!(:image => img)
      end
      flash[:notice] = "Zmiany zostały zapisane."
      redirect_to root_path
    else
      flash[:notice] = "Nie dokonałeś zmian."
      render "edit"
    end
  end

  def destroy
    @cake = Cake.find(params[:id])
    @cake.destroy
    flash[:notice] = "Usunąłeś ciasto."
    redirect_to root_path
  end

  private
  def cake_params
    params.require(:cake).permit(:name, :kind, :description, :remove_image, cake_attachments_attributes: [:id, :cake_id, :image])
  end
end