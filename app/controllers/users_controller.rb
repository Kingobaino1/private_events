class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user_events = current_user.created_events
  end
end
