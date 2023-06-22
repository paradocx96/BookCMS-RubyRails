require "test_helper"

class ProfileControllerTest < ActionDispatch::IntegrationTest

  # Test whether profile view not load because user need to login first
  test "should not view profile" do
    get profile_url

    # Assert Check response is success
    assert_response :redirect
  end
end
