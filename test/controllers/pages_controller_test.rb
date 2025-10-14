require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get practice" do
    get pages_practice_url
    assert_response :success
  end
end
