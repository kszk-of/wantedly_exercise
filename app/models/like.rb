class Like < ApplicationRecord
  belongs_to :skill, counter_cache: :likes_count
  belongs_to :user
end
