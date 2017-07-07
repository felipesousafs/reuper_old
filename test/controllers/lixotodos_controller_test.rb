require 'test_helper'

class LixotodosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lixotodo = lixotodos(:one)
  end

  test "should get index" do
    get lixotodos_url
    assert_response :success
  end

  test "should get new" do
    get new_lixotodo_url
    assert_response :success
  end

  test "should create lixotodo" do
    assert_difference('Lixotodo.count') do
      post lixotodos_url, params: { lixotodo: { data: @lixotodo.data, residente_id: @lixotodo.residente_id } }
    end

    assert_redirected_to lixotodo_url(Lixotodo.last)
  end

  test "should show lixotodo" do
    get lixotodo_url(@lixotodo)
    assert_response :success
  end

  test "should get edit" do
    get edit_lixotodo_url(@lixotodo)
    assert_response :success
  end

  test "should update lixotodo" do
    patch lixotodo_url(@lixotodo), params: { lixotodo: { data: @lixotodo.data, residente_id: @lixotodo.residente_id } }
    assert_redirected_to lixotodo_url(@lixotodo)
  end

  test "should destroy lixotodo" do
    assert_difference('Lixotodo.count', -1) do
      delete lixotodo_url(@lixotodo)
    end

    assert_redirected_to lixotodos_url
  end
end
