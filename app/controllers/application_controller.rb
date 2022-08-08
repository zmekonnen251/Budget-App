class ApplicationController < ActionController::Base


protected

  def update_allowed_params
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name,:email, :password, :password_confirmation, :current_password) }
  end
end
