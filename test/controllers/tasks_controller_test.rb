require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @project_one = projects(:one)
  end

  test "should list all the tasks of that particular project" do
    get project_path(@project_one)
    assert_response :success
  end


  test "Should create a new Task" do
    get project_path(@project_one)
    assert_response :success
    # assert_difference 'Task.count', 1 do
    #   post tasks_path, params: {
    #     task: {
    #      task_name: "Brixton Academy London",
    #      task_description: "Welcome to the Brixton Academy London" 
    #     }
    #   }
    # end
  end

  test "Should update a task" do
  end

  test "Should delete a task" do
  end

  

end
