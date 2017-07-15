class AddColumnLikes < ActiveRecord::Migration[5.1]
  def change
  	add_column :likes, :user_liked_id, :integer
  end
end
