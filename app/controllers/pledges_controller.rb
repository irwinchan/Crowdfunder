class PledgesController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @reward = @project.rewards.find(params[:reward_id])
    @pledge = @reward.pledges.build
  end

  def create
    @pledge = Pledge.new
    @pledge.project_id = params[:project_id]
    @pledge.reward_id = params[:reward_id]
    @pledge.user_id = current_user.id
    if @pledge.save
      redirect_to project_path(params[:project_id])
    else
      render :new
    end
  end
end
