class ProjectsController < ApplicationController
  before_action :set_project, only: %i[update]
  
  def index
    @project = Project.first
    # On home route, there will be a form for new tasks
    @task = @project.tasks.new
  end

  def create 
    @project = Project.new(project_params)
    if @project.save
      # respond_to do |format|
      #   format.js { render 'create.js.erb' } 
      # end
      redirect_to project_path(@project)
    else 
      flash[:danger] = @project.errors.full_messages.join(",")
    end
  end

  def update
    if @project.update(project_params)
      redirect_to project_path(@project)
    else
      flash[:danger] = @project.errors.full_messages.join(",")
    end
  end

  private

  def set_project 
    @project = Project.find_by(id: params[:id])
  end

  def project_params
    params.require(:project).permit(:project_name)
  end

end
