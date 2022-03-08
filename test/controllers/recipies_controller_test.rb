require "test_helper"

class RecipiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get recipies_index_url
    assert_response :success
  end
end
