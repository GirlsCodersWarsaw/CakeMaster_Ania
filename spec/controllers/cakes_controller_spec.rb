require 'spec_helper'
require 'rails_helper'

RSpec.describe CakesController do
  describe "GET index" do
    it "assigns @cakes" do
      cake = Cake.create
      get :index
      expect(assigns(:cake)).to eq([cake])
    end
  end
  end