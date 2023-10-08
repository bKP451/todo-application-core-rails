require 'rails_helper'

RSpec.describe Task, type: :model do
  context "For Tasks" do
    subject {
    mad_love = Project.create(project_name: "Big Fights")
    Task.new(
      task_name: "Wish I never met you",
      task_description: "Give me your number",
      project: mad_love
    )}

    it 'if task_name and task_description is present then task should be saved in the database' do
      subject.save
      expect(Task.count).to eq 1
    end

    it "If task name is not present then task should not be saved in the database" do
      subject.task_name = ""
      subject.save
      expect(Task.count).to eq 0
    end

    it "If task decription is not present then task should not be saved in the database" do
      subject.task_description = ""
      subject.save
      expect(Task.count).to eq 0
    end

    it "if does not belong to any project should not save" do
      subject.project = nil
      subject.save
      expect(Task.count).to eq 0
    end

  end
end
