class SessionsController < ApplicationController
  def new
    # Present an empty login form
    @business = Business.new
  end

  def create
    @user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = @user.id.to_s
    redirect_to user_path(@user.id), notice: "Signed in!"
    @business = Business.where(name: params[:business][:name]).first
    if @business && @business.authenticate(params[:business][:password])
      session[:business_id] = @business.id.to_s
      redirect_to business_path(@business.id)
    else
      redirect_to root_path
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end

end