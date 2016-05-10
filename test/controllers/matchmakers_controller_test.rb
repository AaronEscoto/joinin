require 'test_helper'

class MatchmakersControllerTest < ActionController::TestCase
  setup do
    @matchmaker = matchmakers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:matchmakers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create matchmaker" do
    assert_difference('Matchmaker.count') do
      post :create, matchmaker: { address: @matchmaker.address, latitude: @matchmaker.latitude, longitude: @matchmaker.longitude, uid: @matchmaker.uid }
    end

    assert_redirected_to matchmaker_path(assigns(:matchmaker))
  end

  test "should show matchmaker" do
    get :show, id: @matchmaker
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @matchmaker
    assert_response :success
  end

  test "should update matchmaker" do
    patch :update, id: @matchmaker, matchmaker: { address: @matchmaker.address, latitude: @matchmaker.latitude, longitude: @matchmaker.longitude, uid: @matchmaker.uid }
    assert_redirected_to matchmaker_path(assigns(:matchmaker))
  end

  test "should destroy matchmaker" do
    assert_difference('Matchmaker.count', -1) do
      delete :destroy, id: @matchmaker
    end

    assert_redirected_to matchmakers_path
  end
end
