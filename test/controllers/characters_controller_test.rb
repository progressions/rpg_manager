require 'test_helper'

class CharactersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    post sessions_url(email: "narrator@bluerose.rpg", password: "password")
    @encounter = Encounter.create! name: "Woods", user: users(:one)
    get encounter_characters_url(encounter_id: @encounter.id)
    assert_response :success
  end
end
