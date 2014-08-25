class UsessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    usession[:user_id] = user.id
    redirect_to root_url
  end

  def destroy
    usession[:user_id] = nil
    redirect_to root_url
  end
end