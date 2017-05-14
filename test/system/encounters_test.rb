require "application_system_test_case"

class EncountersTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit encounters_url

    assert_selector "h1", text: "Encounters"
    click_on "New Encounter"

    assert_selector "h1", text: "New Encounter"
    fill_in "Name", with: "City encounter"

    click_on "Create"
    assert_selector "a", text: "City encounter"

    click_on "City encounter"

    fill_in "Name", with: "Bartholomew"
    fill_in "Health", with: "25"
    click_on "Add"

    assert_selector "td", text: "Bartholomew"
    assert_text "Bartholomew joined the encounter"

    fill_in "Name", with: "Zombie"
    fill_in "Health", with: "20"
    click_on "Add"

    assert_selector "td", text: "Zombie"
    assert_text "Zombie joined the encounter"

    fill_in "Message", with: "Hello everyone\n"
    assert_text "Hello everyone"

    within "#list tr:nth-of-type(2)" do
      click_on "-"
      click_on "-"
      click_on "-"
    end

    assert_text "Zombie now has 17 health"

    within "#list tr:nth-of-type(2)" do
      click_on "Remove"
    end

    assert_text "Zombie has been removed from the encounter"
  end
end
