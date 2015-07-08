class CakesController < ApplicationController
  def index
    @cakes = Cake.all
  end

  def new
    @cake = Cake.new
  end

  def create
    @cake = Cake.new
    if @cake.save
      redirect_to @cake
    end
    end
end

