class ApplicationController < ActionController::Base
	#  include Rails.application.routes.url_helpers
  
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :get_categories
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
  def get_categories
    @categories = Category.is_published
  end
end
