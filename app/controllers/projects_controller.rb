class ProjectsController < ApplicationController
  def index
    @projects = Project.order(ended_at: :desc)
  end
end
