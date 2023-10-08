require 'rails_helper'

RSpec.feature "CanCreateNewTasks", type: :feature do
  # pending "add some scenarios (or delete) #{__FILE__}"
  describe "Can create new task" do
    it "Click on Add on  project description should create new a task" do
      project = Project.create(project_name: "Take my hand")
      visit root_path
      expect(page).to have_http_status(200)
      expect(page).to have_selector('.add-task-button')
      fill_in "task[task_name]", with: "Binay Artificial Intelligence"
      fill_in "task[task_description]", with: "Hello there"
      find('.add-task-button').click
      expect(page).to have_text("Hello there")
    end 
  end
end
