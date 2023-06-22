require "test_helper"

class RegistrationControllerTest < ActionDispatch::IntegrationTest

  # Test whether registration view load
  test "should view registration page" do
    get registration_url

    # Assert Check response is success
    assert_response :success
  end

  # Test whether registration with sample data
  test "should register user" do
    # Check User count on creation
    assert_difference("User.count") do
      post registration_url, params: { user: { name: 'User One', username: 'sample11', email: 'user11@email.com', password: 'Password@123', password_confirmation: 'Password@123' } }
    end

    # Check redirection when user registration done
    assert_redirected_to root_url
  end
end
