require 'test_helper'

class RoastsControllerTest < ActionController::TestCase
  setup do
    @roast = roasts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:roasts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create roast" do
    assert_difference('Roast.count') do
      post :create, roast: { available: @roast.available, description: @roast.description, name: @roast.name, price: @roast.price, roaster: @roast.roaster, type: @roast.type }
    end

    assert_redirected_to roast_path(assigns(:roast))
  end

  test "should show roast" do
    get :show, id: @roast
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @roast
    assert_response :success
  end

  test "should update roast" do
    patch :update, id: @roast, roast: { available: @roast.available, description: @roast.description, name: @roast.name, price: @roast.price, roaster: @roast.roaster, type: @roast.type }
    assert_redirected_to roast_path(assigns(:roast))
  end

  test "should destroy roast" do
    assert_difference('Roast.count', -1) do
      delete :destroy, id: @roast
    end

    assert_redirected_to roasts_path
  end
end
