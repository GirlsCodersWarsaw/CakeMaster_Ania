require 'spec_helper'
require 'rails_helper'
require 'devise'

describe CakesController do
  login_user
  context "shows a list of cakes" do
    it "gets :index view" do
    get :index
    end
    it "renders index template" do
      render_template(:index)
  end
  context "shows creating new cake page" do
    it "gets :new view" do
    get :new
    end
    it "renders new template" do
      render_template(:new)
    end
  end
  end
  end