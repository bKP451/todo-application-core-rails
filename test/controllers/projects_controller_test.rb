require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @project_one = projects(:one)
  end

  test "should get index" do
    get root_path
    assert_response :success
  end

  test "Title on home page" do
    get root_path
    assert_select "title", "To do"
  end

  test "Title should be project name appended by Todo on individual project page" do
    get project_path(@project_one)
    assert_select "title", "#{@project_one.project_name} - To do"
  end


end
