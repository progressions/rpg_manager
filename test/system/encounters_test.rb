require "application_system_test_case"

class EncountersTest < ApplicationSystemTestCase
  test "encounters CRUD" do
    visit signin_url

    fill_in "Email", with: "narrator@bluerose.rpg"
    fill_in "Password", with: "password"
    within ".actions" do
      click_on "Log In"
    end

    visit encounters_url

    assert_selector "h1", text: "Encounters"
    click_on "Create an Encounter"

    assert_selector "h1", text: "New Encounter"
    fill_in "Name", with: "City encounter"

    click_on "Create"

    within ".narrated_encounters p:nth-of-type(4)" do
      assert_selector "a", text: "City encounter"
      click_on "edit"
    end

    fill_in "Name", with: "City Alleys"
    click_on "Update Encounter"

    within ".narrated_encounters p:nth-of-type(4)" do
      assert_selector "a", text: "City Alleys"
    end
  end
end
