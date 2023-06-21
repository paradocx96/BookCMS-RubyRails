class ProfileController < ApplicationController
  # User Authentication Check
  before_action :require_auth

  # User Profile View Load
  def index
  end
end
