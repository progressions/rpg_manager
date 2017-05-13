require 'test_helper'

class EncountersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get encounters_index_url
    assert_response :success
  end

end
