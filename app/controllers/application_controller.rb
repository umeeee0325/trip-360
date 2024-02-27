class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :gender_id, :profile, :residence_id, :age_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :profile, :gender_id, :residence_id, :age_id])
  end
end
