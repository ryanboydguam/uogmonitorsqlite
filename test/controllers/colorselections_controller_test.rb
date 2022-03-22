require "test_helper"

class ColorselectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @colorselection = colorselections(:one)
  end

  test "should get index" do
    get colorselections_url
    assert_response :success
  end

  test "should get new" do
    get new_colorselection_url
    assert_response :success
  end

  test "should create colorselection" do
    assert_difference('Colorselection.count') do
      post colorselections_url, params: { colorselection: { blue: @colorselection.blue, green: @colorselection.green, red: @colorselection.red } }
    end

    assert_redirected_to colorselection_url(Colorselection.last)
  end

  test "should show colorselection" do
    get colorselection_url(@colorselection)
    assert_response :success
  end

  test "should get edit" do
    get edit_colorselection_url(@colorselection)
    assert_response :success
  end

  test "should update colorselection" do
    patch colorselection_url(@colorselection), params: { colorselection: { blue: @colorselection.blue, green: @colorselection.green, red: @colorselection.red } }
    assert_redirected_to colorselection_url(@colorselection)
  end

  test "should destroy colorselection" do
    assert_difference('Colorselection.count', -1) do
      delete colorselection_url(@colorselection)
    end

    assert_redirected_to colorselections_url
  end
end
