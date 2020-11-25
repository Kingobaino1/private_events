class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # def current_user
  #   @current_user ||= super && User.includes(:created_events).find(@current_user.id)
  # end

  protected
  def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
