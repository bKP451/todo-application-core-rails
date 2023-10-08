require 'rails_helper'

RSpec.describe Project, type: :model do
  context "For project" do
    subject {
      Project.new
    }
    it 'if project_name is present then  saves project in the database' do
      subject.project_name = "I Promise you will see the sun again"
      subject.save
      expect(Project.count).to eq 1
    end
    
    it "When Project_name is absent then it should not save in the database" do
      subject.project_name = ""
      expect(subject).not_to be_valid
      subject.save
      expect(Project.count). to eq 0
    end

    it "When Project name's lenght is greater than 255, then it should not save in the database" do
      subject.project_name = "florian" * 255
      expect(subject).not_to be_valid
      subject.save
      expect(Project.count).to eq 0
    end
  end
end
