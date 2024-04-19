class ApplicationController < ActionController::Base

  before_action :initialize_session
  helper_method :cart

  private
  def initialize_session
    session[:shopping_cart] ||= [] #Contains Amiibo Ids
  end

  def cart
    Amiibo.find(session[:shopping_cart])
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :provinceId, :postalCode, :address])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :provinceId, :postalCode, :address])
  end

end
