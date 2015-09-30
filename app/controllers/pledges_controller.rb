class PledgesController < ApplicationController
	def new
		@pledge = Pledge.new
	end

	def create
		@pledge = Pledge.new(pledges_params)
		if @pledge.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	private
	def pledges_params
		params.require(:pledge).permit(:amount)
	end
end
