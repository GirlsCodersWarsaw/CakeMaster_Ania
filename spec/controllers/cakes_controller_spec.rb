require 'spec_helper'
require 'rails_helper'
require 'devise'

describe CakesController do
  login_user
  context "shows a list of cakes" do
    it "renders index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end
  context "shows creating new cake page" do
    it "renders new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end
  context "create cake with valid attributes" do
    it "saves a new cake" do
      cake=create(:cake)
      post :create, session: { name: 'sernik', kind: 'tasty', description: 'sernik sernik sernik' }
      expect(response).to redirect_to(root_path)
    end
  end

  context "with invalid attributes" do
    it "does not save the new contact" do
      cake=create(:cake)
      expect{
        post :create, session: { name: 'sernik', kind: 'tasty', description: 'sernik sernik sernik' }
      }.to_not change(Cake,:count)
    end
  end
end