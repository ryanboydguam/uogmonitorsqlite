require "test_helper"

class SslChecksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ssl_check = ssl_checks(:one)
  end

  test "should get index" do
    get ssl_checks_url
    assert_response :success
  end

  test "should get new" do
    get new_ssl_check_url
    assert_response :success
  end

  test "should create ssl_check" do
    assert_difference('SslCheck.count') do
      post ssl_checks_url, params: { ssl_check: { addressindex: @ssl_check.addressindex, creation: @ssl_check.creation, monitor: @ssl_check.monitor, status: @ssl_check.status } }
    end

    assert_redirected_to ssl_check_url(SslCheck.last)
  end

  test "should show ssl_check" do
    get ssl_check_url(@ssl_check)
    assert_response :success
  end

  test "should get edit" do
    get edit_ssl_check_url(@ssl_check)
    assert_response :success
  end

  test "should update ssl_check" do
    patch ssl_check_url(@ssl_check), params: { ssl_check: { addressindex: @ssl_check.addressindex, creation: @ssl_check.creation, monitor: @ssl_check.monitor, status: @ssl_check.status } }
    assert_redirected_to ssl_check_url(@ssl_check)
  end

  test "should destroy ssl_check" do
    assert_difference('SslCheck.count', -1) do
      delete ssl_check_url(@ssl_check)
    end

    assert_redirected_to ssl_checks_url
  end
end
