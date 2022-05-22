module Api 
  class UsersController < ApplicationController
    def index
      users = User.all;
      render json: users, status: :ok
    end
    
    def create
      user = User.new(user_params)

      if user.save
        render json: user, status: :created
      else
        render status: :unprocessable_entity
      end
    end

    private

    def user_params
      params.require(:user).permit(:name, :article_limit)
    end

    
  end
end