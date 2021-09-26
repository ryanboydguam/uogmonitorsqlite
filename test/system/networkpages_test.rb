require "application_system_test_case"

class NetworkpagesTest < ApplicationSystemTestCase
  setup do
    @networkpage = networkpages(:one)
  end

  test "visiting the index" do
    visit networkpages_url
    assert_selector "h1", text: "Networkpages"
  end

  test "creating a Networkpage" do
    visit networkpages_url
    click_on "New Networkpage"

    fill_in "Address", with: @networkpage.address
    fill_in "Addressindex", with: @networkpage.addressindex
    fill_in "Creation", with: @networkpage.creation
    fill_in "Monitor", with: @networkpage.monitor
    fill_in "Relaytime", with: @networkpage.relaytime
    fill_in "Status", with: @networkpage.status
    click_on "Create Networkpage"

    assert_text "Networkpage was successfully created"
    click_on "Back"
  end

  test "updating a Networkpage" do
    visit networkpages_url
    click_on "Edit", match: :first

    fill_in "Address", with: @networkpage.address
    fill_in "Addressindex", with: @networkpage.addressindex
    fill_in "Creation", with: @networkpage.creation
    fill_in "Monitor", with: @networkpage.monitor
    fill_in "Relaytime", with: @networkpage.relaytime
    fill_in "Status", with: @networkpage.status
    click_on "Update Networkpage"

    assert_text "Networkpage was successfully updated"
    click_on "Back"
  end

  test "destroying a Networkpage" do
    visit networkpages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Networkpage was successfully destroyed"
  end
end
