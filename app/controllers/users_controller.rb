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
    # Create campaign_user to add foreign keys to connect campaign and user
    CampaignUser.create(user_id:current_user.id,campaign_id:params[:campaign])
    # Subtract a Tweet as payment from the Business
    @business = current_user.campaigns.last.business
    # puts "THESE THINGS"
    # puts @business
    # puts @business.tweets
    # @business.update(tweets: (@business.tweets-1))
    # puts @business.tweets
    redirect_to users_path
  end

end