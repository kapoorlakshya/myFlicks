require 'test_helper'

class YourFlicksControllerTest < ActionController::TestCase
  setup do
    @your_flick = your_flicks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:your_flicks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create your_flick" do
    assert_difference('YourFlick.count') do
      post :create, your_flick: {  }
    end

    assert_redirected_to your_flick_path(assigns(:your_flick))
  end

  test "should show your_flick" do
    get :show, id: @your_flick
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @your_flick
    assert_response :success
  end

  test "should update your_flick" do
    patch :update, id: @your_flick, your_flick: {  }
    assert_redirected_to your_flick_path(assigns(:your_flick))
  end

  test "should destroy your_flick" do
    assert_difference('YourFlick.count', -1) do
      delete :destroy, id: @your_flick
    end

    assert_redirected_to your_flicks_path
  end
end
