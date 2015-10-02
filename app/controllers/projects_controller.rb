class ProjectsController < ApplicationController
  def index
    @projects = Project.order(ended_at: :desc).page(params[:page])
  end

  def new
    @project = Project.new
    @categories = Category.all
  end

  def show
    @project = Project.find(params[:id])
    @pledge = Pledge.new
    @categories = @project.categories

    @amount_raised = 0
    @project.rewards.each do |reward|
      #@amount_raised += reward.pledges.sum("amount")
      @amount_raised += reward.backer_limit * reward.pledges.count
    end

    @days_left = (@project.ended_at - @project.started_at)/(60*60*24)

  end

  def create
    @project = Project.new(projects_params)
    if @project.save
      redirect_to projects_path, notice: "Project created successfully!"
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(projects_params)
      redirect_to projects_path, notice: "Project Info Updated!"
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path, notice: "Project deleted!"
  end

  private
  def projects_params
    params.require(:project).permit(:name, :description, :funding_goal, :started_at, :ended_at, rewards_attributes: [:description, :name, :backer_limit, :_destroy], :category_ids => [])
  end
end
