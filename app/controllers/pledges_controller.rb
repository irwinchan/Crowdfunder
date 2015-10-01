class PledgesController < ApplicationController
	# before_action :load_project
	before_action :load_reward

	def new
		@pledge = Pledge.new
	end

	def create
		@pledge = @reward.pledges.build(pledge_params)
		@pledge.user_id = current_user.id
		if @pledge.save
			redirect_to project_reward_path(@reward.project_id, @reward)
		else
			render 'new'
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

	# def load_project
	# 	@project = Project.find(params[:project_id])
	# end
end
