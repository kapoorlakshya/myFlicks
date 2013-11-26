require 'test_helper'

class ImdbDataControllerTest < ActionController::TestCase
  setup do
    @imdb_datum = imdb_data(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:imdb_data)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create imdb_datum" do
    assert_difference('ImdbDatum.count') do
      post :create, imdb_datum: { genre: @imdb_datum.genre, imdb_id: @imdb_datum.imdb_id, plot: @imdb_datum.plot, poster: @imdb_datum.poster, rating: @imdb_datum.rating, release_date: @imdb_datum.release_date, runtime: @imdb_datum.runtime, title: @imdb_datum.title, type: @imdb_datum.type, year: @imdb_datum.year }
    end

    assert_redirected_to imdb_datum_path(assigns(:imdb_datum))
  end

  test "should show imdb_datum" do
    get :show, id: @imdb_datum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @imdb_datum
    assert_response :success
  end

  test "should update imdb_datum" do
    patch :update, id: @imdb_datum, imdb_datum: { genre: @imdb_datum.genre, imdb_id: @imdb_datum.imdb_id, plot: @imdb_datum.plot, poster: @imdb_datum.poster, rating: @imdb_datum.rating, release_date: @imdb_datum.release_date, runtime: @imdb_datum.runtime, title: @imdb_datum.title, type: @imdb_datum.type, year: @imdb_datum.year }
    assert_redirected_to imdb_datum_path(assigns(:imdb_datum))
  end

  test "should destroy imdb_datum" do
    assert_difference('ImdbDatum.count', -1) do
      delete :destroy, id: @imdb_datum
    end

    assert_redirected_to imdb_data_path
  end
end
