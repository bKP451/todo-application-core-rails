require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @task_one = tasks(:one)
    @task_two = tasks(:two)
    @project_one = projects(:one)
    @project_two = projects(:two)
  end

  test "Indiviual task item should have task title and task description" do
    assert @task_one.valid?
  end

  test "If any of the field are absent, then the individual task item is invalid" do
    @task_one.task_name = ""
    assert_not @task_one.valid?
    @task_one.task_name = "Would you wise enough to let me go ?"
    @task_one.task_description = ""
    assert_not @task_one.valid?
  end

  test "Removing project references should result in invalid task item" do
    @task_one.project = nil
    assert_not @task_one.valid? 
    @task_one.project = @project_one
    assert @task_one.valid?
  end

  test "Validating the length of Project title" do
    @task_one.task_name = "f" * 50
    assert @task_one.valid?
    @task_two.task_name = "f" * 300
    assert_not @task_two.valid?
  end
  
  test "Validating the lenght of Project description" do
    @task_one.task_description = "d" * 50
    assert @task_one.valid?
    @task_two.task_description = "d" * 300
    assert_not @task_two.valid?
  end
end
