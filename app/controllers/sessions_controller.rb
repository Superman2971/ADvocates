class SessionsController < ApplicationController
  def new
    @business = Business.new
  end

  def create
    if @business == Business.new || params[:test] == "test"
      @business = Business.where(email: params[:business][:email]).first
      if @business && @business.authenticate(params[:business][:password])
        session[:business_id] = @business.id.to_s
        redirect_to business_path(@business.id)
      else 
        redirect_to root_path
      end 
    else
      omniauth = env["omniauth.auth"] 
      user = User.find_or_create_with_omniauth(omniauth)
      session[:user_id] = user.id
      redirect_to user_path(user.id), notice: "Signed in!"
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end

end