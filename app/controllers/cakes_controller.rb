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

  def edit
    @cake = Cake.find(params[:id])
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

  private
  def cake_params
    params.require(:cake).permit(:name, :kind, :description)
  end
end