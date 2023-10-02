class ApplicationController < ActionController::Base
  before_action :load_all_projects
  
  def load_all_projects
    @projects = Project.all
  end

end
