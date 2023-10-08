require 'rails_helper'

RSpec.describe "CreationOfNewTasks", type: :request do
  describe "creation_of_new_tasks" do
    it "Able to create new tasks" do
      project = Project.create(project_name: "Brixton Academy")
      get root_path
      expect(response).to have_http_status(200)
      # click_on "add-task-button"
      # expect(page).to have_content("Task name can't be blank,Task description can't be blank
      # ")
    end
  end
end
