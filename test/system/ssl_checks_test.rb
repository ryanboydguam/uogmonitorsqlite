require "application_system_test_case"

class SslChecksTest < ApplicationSystemTestCase
  setup do
    @ssl_check = ssl_checks(:one)
  end

  test "visiting the index" do
    visit ssl_checks_url
    assert_selector "h1", text: "Ssl Checks"
  end

  test "creating a Ssl check" do
    visit ssl_checks_url
    click_on "New Ssl Check"

    fill_in "Addressindex", with: @ssl_check.addressindex
    fill_in "Creation", with: @ssl_check.creation
    fill_in "Monitor", with: @ssl_check.monitor
    fill_in "Status", with: @ssl_check.status
    click_on "Create Ssl check"

    assert_text "Ssl check was successfully created"
    click_on "Back"
  end

  test "updating a Ssl check" do
    visit ssl_checks_url
    click_on "Edit", match: :first

    fill_in "Addressindex", with: @ssl_check.addressindex
    fill_in "Creation", with: @ssl_check.creation
    fill_in "Monitor", with: @ssl_check.monitor
    fill_in "Status", with: @ssl_check.status
    click_on "Update Ssl check"

    assert_text "Ssl check was successfully updated"
    click_on "Back"
  end

  test "destroying a Ssl check" do
    visit ssl_checks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ssl check was successfully destroyed"
  end
end
