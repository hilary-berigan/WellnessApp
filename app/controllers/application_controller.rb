class ApplicationController < ActionController::Base
  respond_to :html, :json
  protect_from_forgery with: :exception


  before_action :configure_permitted_parameters, if: :devise_controller?
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :username, :group_name, :email, :password, :remember_me])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password, :remember_me])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :username, :group_name, :email, :password, :current_password, :remember_me])
  end
end
