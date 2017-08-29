require 'rails_helper'

RSpec.describe UserController, type: :controller do

  subject(:user) do
    User.create!(
      username: "critterpower",
      password: "123456")
  end
  
  describe "get#show" do
    it "renders show page" do
      get :show, params: { id: user.id }
      expect(response).to render_template(:show)
    end
  end

  describe "get#index" do
    it "renders index page" do
      get :index
      expect(response).to render_template("index")
    end
  end

describe "POST #create" do
    context "with invalid params" do
      it "validates the presence of the user's username and password" do
        post :create, params: {
          user: {
            username: "critter_power",
            password: ""
          }
        }
        expect(response).to render_template("new")
        expect(flash[:errors]).to be_present
      end
  end
end

end
