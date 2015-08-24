class CakesController < ApplicationController

  def index
    @cakes = Cake.all
  end

  def new
    @cake = Cake.new
  end

  def create
    @cake = Cake.new cake_params
    if @cake.save
      flash[:notice] = "Gratulacje! Dodałeś ciasto."
      redirect_to root_path
    else
      flash.now[:alert] = "Wypełnij wszystkie pola."
      render action: "new"
    end
  end

  def edit
    @cake = Cake.find(params[:id])
    @cake_attachments = @cake.cake_attachments.all
  end

  def update
    @cake = Cake.find(params[:id])
    if @cake.update(cake_params)
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
    params.require(:cake).permit(:name, :kind, :description, cake_attachments_attributes: [:id, :cake_id, :image, :remove_image])
  end
end