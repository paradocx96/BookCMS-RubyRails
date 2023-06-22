require "test_helper"

class LoginControllerTest < ActionDispatch::IntegrationTest
  # Test whether login view load
  test "should view login page" do
    get login_url

    # Assert Check response is success
    assert_response :success
  end

  # Test whether user login to application
  test "should get login" do
    # Sending username and password to login
    post login_url, params: { username: 'navinda', password: 'Navinda@123' }

    # Assert Check response is success
    assert_response :success
  end

  # Test whether user logout
  test "should get logout" do
    delete logout_url

    # Assert Check response is success
    assert_response :success
  end
end
