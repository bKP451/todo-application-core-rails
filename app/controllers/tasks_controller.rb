class TasksController < ApplicationController
  before_action :set_project
  # before_action :set_task, only: %i[ destroy ]

  def show
    @task = @project.tasks.new

    if @project
      @tasks = @project.tasks
    else 
      redirect_to root_path
    end
  end

  def create
    @project = Project.find(params[:task][:project_id])
    @task = @project.tasks.new(task_params)
    if @task.save
      redirect_to project_path(@project)
    else
      flash[:danger] = @task.errors.full_messages.join(",")
      redirect_to project_path(@project)
    end
  end

  def update
    @task = Task.find(params[:id])
    @project = @task.project

    if @task.update(task_params)
      redirect_to project_path(@project)
    else 
      flash[:danger] = @task.errors.full_messages.join(",")
    end

  end
    

  def destroy
    @task = Task.find(params[:id])
    @project = @task.project
    @task.destroy
    redirect_to project_path(@project)
  end

  private

  def set_project 
    @project = Project.find_by(id: params[:id])
  end

  # def set_task 
  #   debugger
  #   @task = Task.find(params[:id])
  # end

  def task_params
    params.require(:task).permit(:task_name, :task_description)
  end
  
end
