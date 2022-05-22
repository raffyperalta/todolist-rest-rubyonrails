class Article < ApplicationRecord
	belongs_to :user

	validates :title, presence: true
	validates :body, presence: true
	validate :user_limit

	def user_limit
		if user.articles.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now).length >= user.article_limit
			errors.add(:user_limit, message: "Article limit has been reached for today.")
		end
	end 

end
