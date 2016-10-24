require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  # test "should get index" do
  #   get :index
  #   assert_response :success
  # end
  #
  # test "should get new" do
  #   get :new
  #   assert_response :success
  # end
  #
  # test "should get show" do
  #   get :show
  #   assert_response :success
  # end
  #
  # test "should get delete" do
  #   get :delete
  #   assert_response :success
  # end
  #
  # test "should get edit" do
  #   get :edit
  #   assert_response :success
  # end
  #
  # test "should get update" do
  #   get :update
  #   assert_response :success
  # end
  #
  # test "should get create" do
  #   get :create
  #   assert_response :success
  # end

  test "Make sure a user can only see their tasks" do
    session[:user_id] = users(:ada).id
    get :show, id: tasks(:adas_task).id #not good enough on its own b/c it doesn't test whether they CAN'T see others' tasks

    assert_response :success
  end

  test "Make sure a user cannot see another user's tasks" do
    session[:user_id] = users(:babbage).id
    get :show, id: tasks(:adas_task).id

    assert_response :redirect
    assert_equal flash[:notice], "You do not have access to that task."
  end

end


# make a model migration so users have many tasks and tasks belong to a user and
