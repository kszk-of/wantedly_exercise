class AddLikesCountToSkills < ActiveRecord::Migration[5.1]
  def change
    add_column :skills, :likes_count, :integer
  end
end
