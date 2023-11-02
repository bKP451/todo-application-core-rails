require 'rails_helper'

RSpec.describe "TaskCompletions", type: :request do
  describe "Checking the functionality of tasks completion checkbox" do

    subject {
      leave = Project.create(project_name: "Why am I still here ?")
      
      Task.create(
        task_name: "I won't sleep",
        task_description: "I won't eat until you are here resting with me",
        project: leave
      )
    }


    it "Check the checkbox on " do
      get project_path(subject)
      expect(response).to have_http_status(200)
      # expect(page).to have_content("I won't sleep")
    end
  end
end
