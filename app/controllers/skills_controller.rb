class SkillsController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]
	def create
		@skill = current_user.skills.build(skill_params)
		if @skill.save
			flash[:success] = "スキルが追加されました"
			redirect_to root_url
		else
			render 'users/new'
		end
	end

	def destroy
		
	end

	def skill_params
		params.require(:skill).permit(:name)
	end
end
