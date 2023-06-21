class LoginController < ApplicationController
  # User Login Page Load
  def index
  end

  ##
  # User Login Method
  # POST method for user login with username & password
  def create
    begin
      # Find user by username in database
      user = User.find_by(username: params[:username])

      # If user found in database check whether user authenticate with correct password
      if user.present? && user.authenticate(params[:password])
        # If username and password are correct store user information in session storage
        session[:user_id] = user.id

        # Redirect to Root Page
        redirect_to root_path, notice: 'User Login Successfully!'
      else
        # When Username and Password incorrect render Login view
        render :index, status: :unprocessable_entity
      end
    rescue => e
      # Logging errors when user login
      logger.error("User Login Error: #{e.message}")
    end
  end

  ##
  # User Logout Method
  # DELETE method for user logout
  def destroy
    begin
      if session[:user_id].present?
        # Remove session storage user information
        session[:user_id] = nil

        # Redirect to Root Path
        redirect_to root_path, notice: 'User Logout Successfully!'
      end
    rescue => e
      # Logging errors when user login
      logger.error("User Logout Error: #{e.message}")
    end
  end
end
