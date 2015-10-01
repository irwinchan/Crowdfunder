class PledgesController < ApplicationController
	before_action :load_reward

	def new
		@pledge = Pledge.new
	end

	def create
		@project = Project.find(params[:project_id])
		@pledge = @reward.pledges.build(pledge_params)
		@pledge.user = current_user

		respond_to do |format|
			if @pledge.save
				@amount_raised = 0
		    @project.rewards.each do |reward|
		      #@amount_raised += reward.pledges.sum("amount")
		      @amount_raised += reward.backer_limit * reward.pledges.count
		    end
				# redirect_to project_path(@reward.project_id)
				format.js
			else
				format.html { render 'projects/show', alert: 'There was an error!' }
			end
		end

	end

	private
	def pledge_params
		params.require(:pledge).permit(:amount)
	end

	def load_reward
		@reward = Reward.find(params[:reward_id])
	end

end
