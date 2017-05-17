require "application_system_test_case"

class GameplayTest < ApplicationSystemTestCase
  test "playing the game" do
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
    assert page.find_field("Name", with: "")

    assert_selector "td", text: "Zombie"
    assert_text "Zombie joined the encounter"

    message_count = Message.count

    fill_in "Message", with: "Hello everyone\n"

    assert_equal message_count+1, Message.count

    within "#messages" do
      assert_selector "div.message.chat", text: "Hello everyone"
    end

    # Don't submit blank messages

    message_count = Message.count

    fill_in "Message", with: "\n"

    assert_equal message_count, Message.count

    within "#messages" do
      # The first message hasn't changed, meaning the blank message didn't submit
      assert_selector "div:nth-of-type(1)", text: "Hello everyone"
    end

    within "#list tr:nth-of-type(2)" do
      click_on "20"
      fill_in "character[health]", with: "20-3"
      click_on "Update"
    end

    within "#messages" do
      assert_selector "div:nth-of-type(1)", text: "Zombie now has 17 health"
    end

    fill_in "Message", with: "Not a valid amount\n"

    within "#list tr:nth-of-type(2)" do
      click_on "17"
      fill_in "character[health]", with: "this is not valid"
      click_on "Update"
    end

    within "#messages" do
      assert_selector "div:nth-of-type(1)", text: "Not a valid amount"
    end

    within "#list tr:nth-of-type(2)" do
      click_on "Remove"
    end

    assert_text "Zombie has been removed from the encounter"
    assert_no_selector "td", text: "Zombie"
  end
end
