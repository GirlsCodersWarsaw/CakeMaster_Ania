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
      flash.now[:error] = "Wypełnij wszystkie pola."
      render action: "new"
    end
  end

  private
  def cake_params
    params.require(:cake).permit(:name, :kind, :description)
  end
end