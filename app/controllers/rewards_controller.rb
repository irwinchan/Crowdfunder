class RewardsController < ApplicationController
  def new
    @reward = Reward.new
  end

  def create
    @reward = Reward.new(reward_params)

    if @reward.save
      redirect_to projects_path
    else
      render :new
    end
  end

  def show
    @reward = Reward.find(params[:id])
  end

  private
  def reward_params
    params.require(:reward).permit(:name, :description, :backer_limit)
  end

end

