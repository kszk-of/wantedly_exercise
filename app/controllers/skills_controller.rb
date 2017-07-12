class SkillsController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]
	before_action :correct_user, only: :destroy
	def create
		@skill = User.find_by(id: params[:skill][:target_id].to_i).skills.build(skill_params)
		@skills = User.find_by(id: params[:skill][:target_id].to_i).skills.pluck(:name)
		unless @skills.include?(@skill.name)
			if @skill.save
				flash[:success] = "スキルが追加されました"
				redirect_to user_path(id: params[:skill][:target_id])
			else
				@feed_items = []
				render 'users/new'
			end
		else
			redirect_to request.referrer, alert: '登録済みのスキルです'
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
