require 'test_helper'

class UserDataControllerTest < ActionController::TestCase
  setup do
    @user_datum = user_data(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_data)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_datum" do
    assert_difference('UserDatum.count') do
      post :create, user_datum: {  }
    end

    assert_redirected_to user_datum_path(assigns(:user_datum))
  end

  test "should show user_datum" do
    get :show, id: @user_datum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_datum
    assert_response :success
  end

  test "should update user_datum" do
    patch :update, id: @user_datum, user_datum: {  }
    assert_redirected_to user_datum_path(assigns(:user_datum))
  end

  test "should destroy user_datum" do
    assert_difference('UserDatum.count', -1) do
      delete :destroy, id: @user_datum
    end

    assert_redirected_to user_data_path
  end
end
