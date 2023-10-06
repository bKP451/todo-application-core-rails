class ProjectsController < ApplicationController
  before_action :set_project, only: %i[update, destroy]
  
  def index
    @project = Project.first
    # On home route, there will be a form for new tasks
    @task = @project.tasks.new
    @project_tasks = @project.tasks
  end

  def create 
    @new_project = Project.new(project_params)
    if @new_project.save
      redirect_to project_path(@new_project)
    else 
      flash[:danger] = @new_project.errors.full_messages.join(",")
    end
  end

  def update
    @this_project = Project.find_by(id: params[:id])
    if @this_project.update(project_params)
      redirect_to project_path(@this_project)
    else
      flash[:danger] = @this_project.errors.full_messages.join(",")
    end
  end

  def destroy
    @current_project.destroy
    redirect_to root_path
  end

  private

  def set_project 
    @current_project = Project.find_by(id: params[:id])
  end

  def project_params
    params.require(:project).permit(:project_name)
  end

end
