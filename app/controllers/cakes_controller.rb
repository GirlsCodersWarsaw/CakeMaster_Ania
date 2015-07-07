class CakesController < ApplicationController
  def index
    @cakes = Cake.all
  end
end

