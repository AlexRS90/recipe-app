require "test_helper"

class IgredientsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get igredients_new_url
    assert_response :success
  end
end
