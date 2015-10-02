class UsersController < ApplicationController
  skip_before_filter :require_login, only: [:index, :new, :create]
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)

    if user.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @backed_projects = []
    @total_backed = 0
    user = User.find(current_user)

    user.pledges.each do |pledge|
      @backed_projects << pledge.reward.project
      @total_backed += pledge.reward.backer_limit
    end
    @backed_projects.uniq!


  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
