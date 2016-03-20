require 'test_helper'

class AlbumnsControllerTest < ActionController::TestCase
  setup do
    @albumn = albumns(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:albumns)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create albumn" do
    assert_difference('Albumn.count') do
      post :create, albumn: {  }
    end

    assert_redirected_to albumn_path(assigns(:albumn))
  end

  test "should show albumn" do
    get :show, id: @albumn
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @albumn
    assert_response :success
  end

  test "should update albumn" do
    patch :update, id: @albumn, albumn: {  }
    assert_redirected_to albumn_path(assigns(:albumn))
  end

  test "should destroy albumn" do
    assert_difference('Albumn.count', -1) do
      delete :destroy, id: @albumn
    end

    assert_redirected_to albumns_path
  end
end
