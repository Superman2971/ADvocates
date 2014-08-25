class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # FOR USER
  helper_method :current_user
  def current_user
      @current_user ||= User.find(usession[:user_id]) if usession[:user_id]
  end

  # FOR BUSINESS
  helper_method :current_business
  def current_business
      @current_business ||= Business.find(bsession[:business_id]) if bsession[:business_id]
  end
end