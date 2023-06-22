require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest

  # Test whether root view load
  test "should view root page" do
    get root_url

    # Assert Check response is success
    assert_response :success
  end
end
