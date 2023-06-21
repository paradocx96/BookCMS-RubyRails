class ApplicationController < ActionController::Base
  # Initialize Helper Methods
  helper_method :current_user, :authorized?

  ##
  # Current_User method
  # Check session storage has user information and get user information base on session data
  def current_user
    begin
      # Initialize current_user base on user login
      @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
    rescue => e
      # Logging errors when current user find
      logger.error("Current User Error: #{e.message}")
    end
  end

  ##
  # Authorized Method
  # Check user logged to the application
  def authorized?
    # Check user logged
    !!current_user
  end

  ##
  # Require_Auth Method
  # Check user Logged or not. If not redirect to Login View
  def require_auth
    # Checked logged and redirect
    redirect_to login_path, alert: 'Please Log In!' unless authorized?
  end
end
