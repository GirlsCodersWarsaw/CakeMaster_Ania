require 'spec_helper'
require 'rails_helper'
require 'devise'

describe CakesController do

  login_user

  describe "GET #index" do
    it "assigns all cakes as @cakes" do
      cake = Cake.create!(name: 'ciasto', kind: 'tasty', description: 'pyszne ciasto')
      get :index
      expect(assigns(:cakes)).to eq([cake])
    end
    it "renders index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #new" do
    it "renders new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do

    context "create cake with valid attributes" do
      let(:parameters) do
        {cake: {name: 'ciasto', kind: 'tasty', description: 'pyszne ciasto'}}
      end
      it "saves a new cake" do
        expect{ post :create, parameters}.to change(Cake, :count).by(1)
      end
      it "shows flash message" do
        post :create, parameters
        expect(flash[:notice]).to be_present
      end
      it "redirects to cakes list" do
        post :create, parameters
        expect(response).to redirect_to(root_path)
      end
    end

    context "create cake with invalid attributes" do
      let(:parameters) do
        {cake: {name: 'ciasto', kind: 'non', description: 'pyszne ciasto'}}
      end
      it "does not save the new cake" do
        expect{ post :create, parameters}.to_not change(Cake, :count)
      end
      it "shows flash message" do
        post :create, parameters
        expect(flash[:alert]).to be_present
      end
      it "redirects to #new action" do
        post :create, parameters
        expect(response).to render_template("new")
      end
    end

  end

  describe "GET edit" do
    it "assigns the requested cake as @cake" do
      cake = Cake.create!(name: 'ciasto', kind: 'tasty', description: 'pyszne ciasto')
      get :edit, {id: cake.to_param}
      expect(assigns(:cake)).to eq(cake)
    end
  end

  describe "PUT update" do

    context "with valid attributes" do
      let(:cake) { Cake.create!(name: 'ciasto', kind: 'tasty', description: 'pyszne ciasto') }
      it "updates the requested cake" do
        put :update, {id: cake.to_param, cake: { name: 'nowe ciasto' }}
        expect(assigns(:cake)).to eq(cake)
      end
      it "shows flash message" do
        put :update, {id: cake.to_param, cake: { name: 'nowe ciasto' }}
        expect(flash[:notice]).to be_present
      end
      it "redirects to the cakes list" do
        put :update, {id: cake.to_param, cake: { name: 'nowe ciasto' }}
        expect(response).to redirect_to(root_path)
      end

    end

    context "with invalid attributes" do
      let(:cake) { Cake.create!(name: 'ciasto', kind: 'tasty', description: 'pyszne ciasto') }
      it "shows flash message" do
        put :update, {id: cake.to_param, cake: { name: '' }}
        expect(flash[:alert]).to be_present
      end
      it "renders #edit" do
        put :update, {id: cake.to_param, cake: { name: '' }}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    let!(:cake) { Cake.create!(name: 'ciasto', kind: 'tasty', description: 'pyszne ciasto') }
    it "destroys the requested cake" do
      expect {delete :destroy, {id: cake.to_param} }.to change(Cake, :count).by(-1)
    end
    it "shows flash message" do
      expect {delete :destroy, {id: cake.to_param} }.to change(Cake, :count).by(-1)
      expect(flash[:notice]).to be_present
    end
    it "redirects to the cakes list" do
      delete :destroy, {id: cake.to_param}
      expect(response).to redirect_to(root_path)
    end
  end

end