require 'test_helper'

class FlicksControllerTest < ActionController::TestCase
  setup do
    @flick = flicks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:flicks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create flick" do
    assert_difference('Flick.count') do
      post :create, flick: { imdb_id: @flick.imdb_id, user_id: @flick.user_id }
    end

    assert_redirected_to flick_path(assigns(:flick))
  end

  test "should show flick" do
    get :show, id: @flick
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @flick
    assert_response :success
  end

  test "should update flick" do
    patch :update, id: @flick, flick: { imdb_id: @flick.imdb_id, user_id: @flick.user_id }
    assert_redirected_to flick_path(assigns(:flick))
  end

  test "should destroy flick" do
    assert_difference('Flick.count', -1) do
      delete :destroy, id: @flick
    end

    assert_redirected_to flicks_path
  end
end
