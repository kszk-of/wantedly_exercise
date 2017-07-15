class RemoveUserLikedIdFromLikes < ActiveRecord::Migration[5.1]
  def change
    remove_column :likes, :user_liked_id, :integer
  end
end
