class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :favorite_ball, %i(image)])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :favorite_ball, %i(image)])
  end

end
