class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
  	@skills = @user.skills
    @likes = Like.where(skill_id: params[:skill_id])
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

  private
	  def user_params
	  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
	  end

	  def current_user
  		@user = User.find(params[:id])
  		redirect_to(root_url) unless current_user?(@user)
  	  end

  	  def admin_user
  	  	redirect_to(root_url) unless current_user.admin?
  	  end
end
