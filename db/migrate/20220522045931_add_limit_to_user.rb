class AddLimitToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :article_limit, :integer
  end
end
