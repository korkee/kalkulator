require 'test_helper'

class ProduktiesControllerTest < ActionController::TestCase
  setup do
    @produkty = produkties(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:produkties)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create produkty" do
    assert_difference('Produkty.count') do
      post :create, produkty: { bialko: @produkty.bialko, ile_gram: @produkty.ile_gram, kalorie: @produkty.kalorie, nazwa: @produkty.nazwa, tluszcze: @produkty.tluszcze, weglowodany: @produkty.weglowodany }
    end

    assert_redirected_to produkty_path(assigns(:produkty))
  end

  test "should show produkty" do
    get :show, id: @produkty
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @produkty
    assert_response :success
  end

  test "should update produkty" do
    patch :update, id: @produkty, produkty: { bialko: @produkty.bialko, ile_gram: @produkty.ile_gram, kalorie: @produkty.kalorie, nazwa: @produkty.nazwa, tluszcze: @produkty.tluszcze, weglowodany: @produkty.weglowodany }
    assert_redirected_to produkty_path(assigns(:produkty))
  end

  test "should destroy produkty" do
    assert_difference('Produkty.count', -1) do
      delete :destroy, id: @produkty
    end

    assert_redirected_to products_path 
  end
end
