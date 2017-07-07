require 'test_helper'

class LixodonesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lixodone = lixodones(:one)
  end

  test "should get index" do
    get lixodones_url
    assert_response :success
  end

  test "should get new" do
    get new_lixodone_url
    assert_response :success
  end

  test "should create lixodone" do
    assert_difference('Lixodone.count') do
      post lixodones_url, params: { lixodone: { data: @lixodone.data, residente_id: @lixodone.residente_id } }
    end

    assert_redirected_to lixodone_url(Lixodone.last)
  end

  test "should show lixodone" do
    get lixodone_url(@lixodone)
    assert_response :success
  end

  test "should get edit" do
    get edit_lixodone_url(@lixodone)
    assert_response :success
  end

  test "should update lixodone" do
    patch lixodone_url(@lixodone), params: { lixodone: { data: @lixodone.data, residente_id: @lixodone.residente_id } }
    assert_redirected_to lixodone_url(@lixodone)
  end

  test "should destroy lixodone" do
    assert_difference('Lixodone.count', -1) do
      delete lixodone_url(@lixodone)
    end

    assert_redirected_to lixodones_url
  end
end
