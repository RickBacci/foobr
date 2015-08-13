class ProjectsController < ApplicationController

  def index
    @projects = current_user.projects.all
  end

  def new
    @project = current_user.projects.new
    @developers = User.where(role: 'developer')
  end

  def create
    @project = current_user.projects.create(project_params)

    if @project
      flash[:message] = "New project created!"
      redirect_to projects_path
    else
      flash[:error] = "New project creation failed!"
      render :back
    end
  end


  private

  def project_params
    params.require(:project).permit([:name, :description])
  end
end
