require "test_helper"

class NetworkpagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @networkpage = networkpages(:one)
  end

  test "should get index" do
    get networkpages_url
    assert_response :success
  end

  test "should get new" do
    get new_networkpage_url
    assert_response :success
  end

  test "should create networkpage" do
    assert_difference('Networkpage.count') do
      post networkpages_url, params: { networkpage: { address: @networkpage.address, addressindex: @networkpage.addressindex, creation: @networkpage.creation, monitor: @networkpage.monitor, relaytime: @networkpage.relaytime, status: @networkpage.status } }
    end

    assert_redirected_to networkpage_url(Networkpage.last)
  end

  test "should show networkpage" do
    get networkpage_url(@networkpage)
    assert_response :success
  end

  test "should get edit" do
    get edit_networkpage_url(@networkpage)
    assert_response :success
  end

  test "should update networkpage" do
    patch networkpage_url(@networkpage), params: { networkpage: { address: @networkpage.address, addressindex: @networkpage.addressindex, creation: @networkpage.creation, monitor: @networkpage.monitor, relaytime: @networkpage.relaytime, status: @networkpage.status } }
    assert_redirected_to networkpage_url(@networkpage)
  end

  test "should destroy networkpage" do
    assert_difference('Networkpage.count', -1) do
      delete networkpage_url(@networkpage)
    end

    assert_redirected_to networkpages_url
  end
end
