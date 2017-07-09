class StaticPagesController < ApplicationController
  def home
  	if logged_in?
  		@skill = current_user.skills.build
  		@feed_items = current_user.feed.paginate(page: params[:page])
  		@likes = Like.where(skill_id: params[:skill_id])
  	end
  end
end
