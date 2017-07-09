class SkillsController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]
	before_action :correct_user, only: :destroy
	def create
		@skill = current_user.skills.build(skill_params)
		if @skill.save
			flash[:success] = "スキルが追加されました"
			redirect_to root_url
		else
			@feed_items = []
			render 'users/new'
		end
	end

	def destroy
		@skill.destroy
		flash[:success] = "スキル削除"
		redirect_to request.referrer || root_url
	end

	def skill_params
		params.require(:skill).permit(:name)
	end

	def correct_user
		@skill = current_user.skills.find_by(id: params[:id])
		redirect_to root_url if @skill.nil?
	end
end
