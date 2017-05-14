require 'test_helper'

class CharactersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    @encounter = Encounter.create! name: "Woods"
    get encounter_characters_url(encounter_id: @encounter.id)
    assert_response :success
  end
end
