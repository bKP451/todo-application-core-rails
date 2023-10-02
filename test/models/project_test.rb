require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @project_one = projects(:one)
    @project_two = projects(:two)
  end

  test "Each project should have a project name" do
    assert @project_one.valid?
    @project_one.project_name = ""
    assert_not @project_one.valid?
  end
  
  
end
