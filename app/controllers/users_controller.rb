class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :following, :followers]
  def new
  	@user = User.new
  end

  def index
    @users = User.all
  end

  def show
  	@user = User.find(params[:id])
    @skill = current_user.skills.build
  	@skills = @user.skills
    @likes = Like.where(skill_id: params[:skill_id])
    @followers_of_this_user = Relationship.where(follower_id: current_user.id).pluck(:followed_id)
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		log_in @user
  		flash[:success] = "Welcome!"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private
	  def user_params
	  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
	  end

	  def correct_user
  		@user = User.find(params[:id])
  		redirect_to(root_url) unless current_user?(@user)
  	  end

  	  def admin_user
  	  	redirect_to(root_url) unless current_user.admin?
  	  end
end
