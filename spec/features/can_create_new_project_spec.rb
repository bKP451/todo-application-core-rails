require 'rails_helper'

RSpec.feature "CanCreateNewProjects", type: :feature do
  describe "Can create new project on" do
    it "enter or lose focus of the input" do
      project = Project.create(project_name: "White Flag")
      visit project_path(project)
      expect(page).to have_http_status(200)
      expect(page).to have_selector('#new-project-input')
      fill_in "project[project_name]", with: "Sand in my shoes"
      page.execute_script("$('form#new-project-input-form').submit();")
      expect(page).to have_content("Sand in my shoes")
    end
  end
end
