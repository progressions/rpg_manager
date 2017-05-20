require 'test_helper'

class EncountersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    post sessions_url(email: "narrator@bluerose.rpg", password: "password")
    get encounters_url
    assert_response :success
  end

end
