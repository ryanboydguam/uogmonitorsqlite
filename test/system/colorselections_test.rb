require "application_system_test_case"

class ColorselectionsTest < ApplicationSystemTestCase
  setup do
    @colorselection = colorselections(:one)
  end

  test "visiting the index" do
    visit colorselections_url
    assert_selector "h1", text: "Colorselections"
  end

  test "creating a Colorselection" do
    visit colorselections_url
    click_on "New Colorselection"

    fill_in "Blue", with: @colorselection.blue
    fill_in "Green", with: @colorselection.green
    fill_in "Red", with: @colorselection.red
    click_on "Create Colorselection"

    assert_text "Colorselection was successfully created"
    click_on "Back"
  end

  test "updating a Colorselection" do
    visit colorselections_url
    click_on "Edit", match: :first

    fill_in "Blue", with: @colorselection.blue
    fill_in "Green", with: @colorselection.green
    fill_in "Red", with: @colorselection.red
    click_on "Update Colorselection"

    assert_text "Colorselection was successfully updated"
    click_on "Back"
  end

  test "destroying a Colorselection" do
    visit colorselections_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Colorselection was successfully destroyed"
  end
end
