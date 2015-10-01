class PledgesController < ApplicationController
	before_action :load_reward

	def new
		@pledge = Pledge.new
	end

	def create
		@pledge = @reward.pledges.build(pledge_params)
		@pledge.user = current_user
		if @pledge.save
			redirect_to project_path(@reward.project_id)
		else
			render 'projects/show'
		end
		# @pledge = Pledge.new(pledges_params)
		# if @pledge.save
		# 	redirect_to root_path
		# else
		# 	render 'new'
		# end
	end

	private
	def pledge_params
		params.require(:pledge).permit(:amount)
	end

	def load_reward
		@reward = Reward.find(params[:reward_id])
	end

end
