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

    @developer = User.find(project_params[:developer_id])

    @developer.foobr_calendar.items.each do |event|
      event.update!({
        calendar_id: @developer.calendar_id,
        event_id: project_params[:hire][0],
        transparency: nil
      })
    end

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
    params.require(:project).permit(:name, :description, :client_id, :developer_id, :hire => [])
  end
end
