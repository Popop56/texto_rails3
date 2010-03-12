require 'test_helper'

class TextosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:textos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create texto" do
    assert_difference('Texto.count') do
      post :create, :texto => textos(:one).attributes
    end

    assert_redirected_to texto_path(assigns(:texto))
  end

  test "should show texto" do
    get :show, :id => textos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => textos(:one).to_param
    assert_response :success
  end

  test "should update texto" do
    put :update, :id => textos(:one).to_param, :texto => textos(:one).attributes
    assert_redirected_to texto_path(assigns(:texto))
  end

  test "should destroy texto" do
    assert_difference('Texto.count', -1) do
      delete :destroy, :id => textos(:one).to_param
    end

    assert_redirected_to textos_path
  end
end
