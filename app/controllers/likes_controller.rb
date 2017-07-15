class LikesController < ApplicationController
  def create
    @like = Like.create(user_id: current_user.id, skill_id: params[:skill_id])
    @likes = Like.where(skill_id: params[:skill_id])
    redirect_to request.referrer
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, skill_id: params[:skill_id])
    like.destroy
    @likes = Like.where(skill_id: params[:skill_id])
    redirect_to request.referrer
  end
end