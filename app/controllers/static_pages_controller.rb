class StaticPagesController < ApplicationController
  def home
  	if logged_in?
  		@skill = current_user.skills.build
  		@feed_items = current_user.feed.paginate(page: params[:page])
  	end
  end
end
