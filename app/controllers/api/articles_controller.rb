module Api 
  class ArticlesController < ApplicationController
    def index
      binding.pry
      articles = Article.order('created_at DESC');
      render json: articles, status: :ok
    end

    def create
      # binding.pry
      article = Article.new(article_params)
      
      if article.save
        render json: article, status: :created
      else
        render json: article.errors, status: :unprocessable_entity
      end
    end

    def article_params
      params.require(:article).permit(:title, :body, :user_id)
    end

  end
end