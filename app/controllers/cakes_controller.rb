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
      redirect_to root_path
    else
      render "new"
    end
  end

  private
  def cake_params
    params.require(:cake).permit(:name, :kind, :description)
  end
end

