class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :update_allowed_params, if: :devise_controller?

  add_flash_types :success, :info, :warning, :danger, :alert, :error, :notice

  protected

  def update_allowed_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password password_confirmation])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[name email password password_confirmation current_password])
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[email password])
  end
end
