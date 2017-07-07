require 'test_helper'

class ResidentesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @residente = residentes(:one)
  end

  test "should get index" do
    get residentes_url
    assert_response :success
  end

  test "should get new" do
    get new_residente_url
    assert_response :success
  end

  test "should create residente" do
    assert_difference('Residente.count') do
      post residentes_url, params: { residente: { curso_id: @residente.curso_id, matricula: @residente.matricula, nome: @residente.nome, quarto_id: @residente.quarto_id } }
    end

    assert_redirected_to residente_url(Residente.last)
  end

  test "should show residente" do
    get residente_url(@residente)
    assert_response :success
  end

  test "should get edit" do
    get edit_residente_url(@residente)
    assert_response :success
  end

  test "should update residente" do
    patch residente_url(@residente), params: { residente: { curso_id: @residente.curso_id, matricula: @residente.matricula, nome: @residente.nome, quarto_id: @residente.quarto_id } }
    assert_redirected_to residente_url(@residente)
  end

  test "should destroy residente" do
    assert_difference('Residente.count', -1) do
      delete residente_url(@residente)
    end

    assert_redirected_to residentes_url
  end
end
