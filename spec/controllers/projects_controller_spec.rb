require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  context "checking for project create action" do


    subject {
      Project.new(project_name: "Do not come crying to me!")
    }

    it "When Project has some name" do
      expect(subject).to be_valid
      subject.save
      expect(Project.count).to eq 1
    end

    it "When giving empty project name" do
      subject.project_name = ""
      expect(subject).not_to be_valid
      subject.save
      expect(Project.count).to eq 0
    end

    it "When giving project name greater than 255 characters" do
      subject.project_name = "florian" * 255 
      expect(subject).not_to be_valid
      subject.save
      expect(Project.count).to eq 0
    end
  end

end
