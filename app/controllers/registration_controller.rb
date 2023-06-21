class RegistrationController < ApplicationController
  # User Registration Page Load
  def index
    @user = User.new
  end

  ##
  # User Registration Method
  # POST method for user registration using user model params
  def create
    # Initialized user object with params data
    @user = User.new(user_params)

    begin
      # Saving user in DB
      if @user.save
        # Save user id in session storage if user saved in database
        session[:user_id] = @user.id

        # Redirect to Root Path and Notify user registration
        redirect_to root_path, notice: 'User Successfully Registered!'
      else
        # If User didn't registered load same page and notify errors
        render :index, status: :unprocessable_entity
      end
    rescue => e
      # Logging errors when user registration
      logger.error("User Registration Error: #{e.message}")
    end
  end

  private

  ##
  # User Params Method
  # User parameters for create new user
  def user_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
  end
end
