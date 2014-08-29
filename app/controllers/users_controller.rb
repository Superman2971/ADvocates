class UsersController < ApplicationController

  def index
    @users = User.all
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



  def prepare_access_token(oauth_token, oauth_token_secret)

    consumer_key = 'HVnDjU3wFwHrfZoEYhkupIXma'
    consumer_secret = 'gc2xxabstcEJvxU48cCFqJOUYs7uGbm1m0syiUtvYxZLvA3WJk'  

    consumer = OAuth::Consumer.new(consumer_key, consumer_secret,
      { :site => "http://api.twitter.com",
        :scheme => :header
      })
    # now create the access token object from passed values
    token_hash = { :oauth_token => oauth_token,
                   :oauth_token_secret => oauth_token_secret
                 }
    access_token = OAuth::AccessToken.from_hash(consumer, token_hash )
    return access_token
  end


  def post
    puts "LOOOOOOOOOK HEEEEERRRREEEEE"
    @user = current_user
    @tweet = "#FindThisPost"
    @access_token = prepare_access_token(@user.token, @user.token_secret)
    @response = @access_token.request(:post, "http://upload.twitter.com/1/statuses/update.json", :status => @tweet)
    puts @user
    puts @tweet
    puts @user.token
    puts @user.token_secret
    puts @access_token
    puts @response
    redirect_to root_path
  end

end