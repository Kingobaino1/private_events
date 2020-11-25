class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  # This method helps to solve the N + 1 Queries problem
  def self.serialize_from_session key, salt
    record = where(id: key).eager_load(:created_events, :attended_events).first
    record if record && record.authenticatable_salt == salt
  end
end
