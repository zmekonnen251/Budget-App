class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :update_allowed_params , if: :devise_controller?

  protected

  def update_allowed_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password, :password_confirmation, :current_password])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
  end
end
