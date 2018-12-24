class ApplicationController < ActionController::Base
  before_action :set_devise_params, if: :devise_controller?

  def set_devise_params
    devise_parameter_sanitizer.permit(:sign_up) do |user|
      user.permit(:name, :email, :password, :password_confirmation)
    end
  end
end
