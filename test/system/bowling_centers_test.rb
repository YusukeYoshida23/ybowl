require "application_system_test_case"

class BowlingCentersTest < ApplicationSystemTestCase
  setup do
    @bowling_center = bowling_centers(:one)
  end

  test "visiting the index" do
    visit bowling_centers_url
    assert_selector "h1", text: "Bowling Centers"
  end

  test "creating a Bowling center" do
    visit bowling_centers_url
    click_on "New Bowling Center"

    click_on "Create Bowling center"

    assert_text "Bowling center was successfully created"
    click_on "Back"
  end

  test "updating a Bowling center" do
    visit bowling_centers_url
    click_on "Edit", match: :first

    click_on "Update Bowling center"

    assert_text "Bowling center was successfully updated"
    click_on "Back"
  end

  test "destroying a Bowling center" do
    visit bowling_centers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bowling center was successfully destroyed"
  end
end
