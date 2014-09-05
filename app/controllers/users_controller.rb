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
    if (params[:img] == "/avatars/original/missing.png")
    current_user.singletweet(params[:status])
    # Create campaign_user to add foreign keys to connect campaign and user
    CampaignUser.create(user_id:current_user.id,campaign_id:params[:campaign])
    # Add tweet count to the user
    current_user.update_attribute(:tweet_count, current_user.tweet_count + 1)
    # Subtract tweet count from the campaign
    current_user.campaigns.last.update_attribute(:tweets, current_user.campaigns.last.tweets - 1)
    redirect_to users_path
    else
    current_user.imgtweet(params[:status], params[:img])
    # Create campaign_user to add foreign keys to connect campaign and user
    CampaignUser.create(user_id:current_user.id,campaign_id:params[:campaign])
    # Add tweet count to the user
    current_user.update_attribute(:tweet_count, current_user.tweet_count + 1)
    # Subtract tweet count from the campaign
    current_user.campaigns.last.update_attribute(:tweets, current_user.campaigns.last.tweets - 1)
    redirect_to users_path
    end
  end

end