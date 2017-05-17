require "application_system_test_case"

class EncountersTest < ApplicationSystemTestCase
  test "encounters CRUD" do
    visit encounters_url

    assert_selector "h1", text: "Encounters"
    click_on "New Encounter"

    assert_selector "h1", text: "New Encounter"
    fill_in "Name", with: "City encounter"

    click_on "Create"

    within ".encounters p:nth-of-type(3)" do
      assert_selector "a", text: "City encounter"
      click_on "edit"
    end

    fill_in "Name", with: "City Alleys"
    click_on "Update Encounter"

    within ".encounters p:nth-of-type(3)" do
      assert_selector "a", text: "City Alleys"
    end
  end
end
