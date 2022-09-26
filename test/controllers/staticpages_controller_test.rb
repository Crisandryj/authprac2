require "test_helper"

class StaticpagesControllerTest < ActionDispatch::IntegrationTest
  test "should get Home" do
    get staticpages_Home_url
    assert_response :success
  end
end
