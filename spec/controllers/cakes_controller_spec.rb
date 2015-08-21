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
  describe CakesController do
    login_user
    context "with valid attributes" do
      it "creates a new cake" do
        cake = Cake.new(name: "sernik", kind: "tasty", description: "sernik sernik sernik")
        cake.save
      end
      it "redirects to list of cakes" do
        cake = Cake.new(name: "sernik", kind: "tasty", description: "sernik sernik sernik")
        response.should redirect_to root_path
      end
    end
=begin

    context "with invalid attributes" do
      it "does not save the new contact" do
        expect{
          post :create, contact: Factory.attributes_for(:invalid_contact)
        }.to_not change(Contact,:count)
      end

      it "re-renders the new method" do
        post :create, contact: Factory.attributes_for(:invalid_contact)
        response.should render_template :new
      end
    end
=end
  end