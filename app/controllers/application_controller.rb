class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  protect_from_forgery with: :exception

  def current_user
    super.decorate unless super.nil?
  end

  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:email, :password,  :password_confirmation, 
        :firstname, :lastname)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:email, :password,  :password_confirmation, 
        :current_password, :firstname, :lastname )
    end
  end
end
