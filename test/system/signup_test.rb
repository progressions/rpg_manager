require "application_system_test_case"

class SignupTest < ApplicationSystemTestCase
  def setup
    visit encounters_url
    click_on "Sign Up"
  end

  test "signing up with only email" do
    fill_in "Email", with: "erin@bluerose.rpg"
    within ".actions" do
      click_on "Sign Up"
    end
    assert_text "Name can't be blank"
    assert_empty User.where(email: "erin@bluerose.rpg")
  end

  test "signing up with only name and email" do
    fill_in "Email", with: "erin@bluerose.rpg"
    fill_in "Name", with: "Erin"
    within ".actions" do
      click_on "Sign Up"
    end
    assert_text "Password can't be blank"
    assert_empty User.where(email: "erin@bluerose.rpg")
  end

  test "signing up with invalid password confirmation" do
    fill_in "Email", with: "erin@bluerose.rpg"
    fill_in "Name", with: "Erin"
    fill_in "Password", with: "password"
    within ".actions" do
      click_on "Sign Up"
    end
    assert_text "Password confirmation doesn't match"
    assert_empty User.where(email: "erin@bluerose.rpg")
  end

  test "signing up successfully" do
    fill_in "Email", with: "erin@bluerose.rpg"
    fill_in "Name", with: "Erin"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    within ".actions" do
      click_on "Sign Up"
    end
    assert_not_empty User.where(email: "erin@bluerose.rpg")
  end
end
