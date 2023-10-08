require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  subject {
    leave = Project.create(project_name: "Why I am still here ?")
    Task.new(
      task_name: "I won't sleep",
      task_description: "Until you are here resting with me",
      project: leave
    )
  }

  context "checking for tasks create action" do

    it "When tasks does not belong to any project" do
      subject.project = nil
      expect(subject).not_to be_valid
      subject.save
      expect(Task.count).to eq 0
    end
    
    it "When task belongs to a project" do
      expect(subject).to be_valid
      subject.save
      expect(Task.count).to eq 1
    end
  end
  
  context "Testing the tasks update" do
    it "normally" do
      subject.update(task_name: "I will go", task_description: "Until you are here resting with me")
      expect(subject.task_name).to eq "I will g"
    end
  end
  
  # context "Destroying the task" do
  #   it "destroying the task" do
  #     new_project = Project.new(project_name: "I won't sleep")
  #     new_task = new_project.tasks.new(task_name: "I won't go", 
  #           task_description: "Until you are here resting with me")
  #     new_task.save
  #     expect(Task.count).to eq 1
  #     # new_task.destroy
  #     # expect(Task.count).to eq 0

  #     expect {
  #       delete :destroy, params: { id: new_task.id }
  #   }.to change(Task, :count).by(-1)
  #     expect(response).to project_path(new_project)
  #   end
  # end
end

    