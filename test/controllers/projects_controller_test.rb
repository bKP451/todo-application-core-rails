require 'test_helper'
require 'capybara/rails'

class ProjectsControllerTest < ActionDispatch::IntegrationTest 
  include Capybara::DSL

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

  test "Project name should be editable when I click on it and when I click outside of it, it the project name should be updated" do
    get project_path(@project_one)
    
    # Ensuring the initial Project title is displayed
    assert_select ".project-description-section-heading .project-title", text: @project_one.project_name
    
    # find('.project-description-section-heading .project-title h1').click
    within ".project-description-section-heading" do
      find(".project-title").click
    end

    # Ensuring the edit form is displayed
    assert_select '#project-title-form .project-name-description-edit-input', count: 1
  end

  test "Should load all projects on each project page" do
    get project_path(@project_one)
    # Need to put dynamic number of project lists
    assert_select '.projects-listing-section ul li', count: 3
  end

  test "Should create a new Project when I click on create button " do
    get project_path(@project_one)
    
  end


end
