require "test_helper"

class ConfirmationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get confirmations_new_url
    assert_response :success
  end
end
