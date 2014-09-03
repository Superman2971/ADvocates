class UsersController < ApplicationController
  
  def index
    @users = User.all
    @campaigns = Campaign.all
  end

  def show
    @user = User.find(params[:id])
    @campaigns = Campaign.all
  end

  def destroy
    User.find(params[:id]).destroy
    session[:user_id] = nil if session[:user_id] == @user.id
    @user.destroy
    redirect_to root_path
  end

  def post
    current_user.singletweet(params[:status])
    current_user.imgtweet(params[:status], params[:img])
    # Call method to add foreign key to connect
    # campaign and user
    # current_user.tweeted
    redirect_to users_path
  end


end