require 'test_helper'

class BriefsControllerTest < ActionController::TestCase
  setup do
    @brief = briefs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:briefs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create brief" do
    assert_difference('Brief.count') do
      post :create, brief: { content: @brief.content, name: @brief.name, new_create: @brief.new_create, status: @brief.status }
    end

    assert_redirected_to brief_path(assigns(:brief))
  end

  test "should show brief" do
    get :show, id: @brief
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @brief
    assert_response :success
  end

  test "should update brief" do
    put :update, id: @brief, brief: { content: @brief.content, name: @brief.name, new_create: @brief.new_create, status: @brief.status }
    assert_redirected_to brief_path(assigns(:brief))
  end

  test "should destroy brief" do
    assert_difference('Brief.count', -1) do
      delete :destroy, id: @brief
    end

    assert_redirected_to briefs_path
  end
end
