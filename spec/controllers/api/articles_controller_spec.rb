require "rails_helper"
require "pry"

RSpec.describe ::Api::ArticlesController, type: :controller do
  # describe "GET index" do
  #   context "when getting list of articles" do
  #     it "renders articles" do
  #       get :index
  #       # binding.pry
  #       expect(response.code).to eq "200"
  #     end
  #   end
  # end

  describe "POST create" do
    context "when user has not reached limit while creating task" do
      let!(:user) { create :user, name: 'Raffy', article_limit: 2 }
      let!(:article_params) do
        {
          title: 'tite',
          body: 'tite',
          user_id: user.id  
        } 
      end
      
      it "creates a todo task" do
      	post :create, params: article_params
        
        binding.pry
      end
    end
  end
end