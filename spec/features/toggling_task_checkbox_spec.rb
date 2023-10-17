require 'rails_helper'

RSpec.feature "TogglingTaskCheckboxes", type: :feature do
  describe "when toggling checkbox, task Name will be striked out and not striked out" do
    subject {
      new_project = Project.create(project_name: "Sand in my shoes");
      Task.create(
        task_name: "Are you trying to be happy?",
        task_description: "You can get on the plane and fly away.",
        project: new_project
      )
    }
    it "Normal flow" do 
      visit project_path(subject)
      expect(page).to have_content("Sand in my shoes");
      expect(page).to have_selector('.complete-task-checkbox');
      find('.complete-task-checkbox').click
      expect(page).to have_selector('.single-todo-item .read-only label')
      expect(page).to have_selector('.single-todo-item .read-only label', text: "Are you trying to be happy?", style: 'text-decoration: line-through')
    end
  end
end
