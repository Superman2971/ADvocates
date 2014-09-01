class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

private

  def current_business
      @current_business ||= Business.find(session[:business_id]) if session[:business_id]
  end
  helper_method :current_business

  def current_user
  	@current_user ||=User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def business_new
    @business = Business.new
  end

  helper_method :business_new

  def campaign_new
    @campaign = Campaign.new
  end

  helper_method :campaign_new
  
end