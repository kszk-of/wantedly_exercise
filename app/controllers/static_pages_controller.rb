class StaticPagesController < ApplicationController
  def home
  	@skill = current_user.skills.build if logged_in?
  	@feed_items = current_user.feed.paginate(page: params[:page])
  end
end
