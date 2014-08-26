class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_business
  def current_business
      @current_business ||= Business.find(session[:business_id]) if session[:business_id]
  end
end