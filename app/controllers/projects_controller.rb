class ProjectsController < ApplicationController
  def index
    @project = Project.first
    # On home route, there will be a form for new tasks
    @task = @project.tasks.new
  end
end
