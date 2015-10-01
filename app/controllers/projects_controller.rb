class ProjectsController < ApplicationController
  def index
    @projects = Project.order(ended_at: :desc)
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
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
    params.require(:project).permit(:name, :description, :funding_goal, :started_at, :ended_at, rewards_attributes: [:description, :backer_limit, :name, :_destroy])
  end
end
