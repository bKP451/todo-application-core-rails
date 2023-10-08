require 'rails_helper'

RSpec.feature "TaskEditAndDeletes", type: :feature do
  describe "From project description section" do
    it "edit and delete a project" do
      project = Project.create(project_name: "Take me home")
      visit project_path(project)
      expect(page).to have_http_status(200)
      new_task = project.tasks.create(task_name: "I won't go", 
        task_description: "Until you are here resting here with me")
      expect(Task.count).to eq 1
      # find('.edit-button').click
      visit project_path(project)
      expect(page).to have_selector('svg.edit-button')
      find('svg.edit-button').click
      fill_in "task[task_name]", with: "Nothing I have is truly mine"
      fill_in "task[task_description]", with: "Life for Rent"
      expect(page).to have_selector('.update-task')
    end
  end
end
