class User < ActiveRecord::Base
  has_many :campaign_users
  has_many :campaigns, through: :campaign_users

  def self.find_or_create_with_omniauth(auth)
    puts auth.to_json
  	user = find_by(uid: auth.slice(:uid).uid) || initialize_from_omniauth(auth)
  	user.update_dynamic_attributes(auth)
  end

 def self.initialize_from_omniauth(auth)
 	new do |user|
 		user.provider = auth[:provider]
 		user.uid = auth[:uid]
 		user.name = auth[:info][:name]
    user.token = auth[:credentials][:token]
    user.token_secret = auth[:credentials][:secret]
    user.screen_name = auth[:extra][:raw_info][:screen_name]
 		user.save!
 	end
 end

 def update_dynamic_attributes(auth)
 	self.location = auth[:info][:location] 
 	self.image = auth[:info][:image] 
 	self.description = auth[:info][:description]
  self.followers = auth[:extra][:raw_info][:followers_count]
  self.friends = auth[:extra][:raw_info][:friends_count]
  self.background_image = auth[:extra][:raw_info][:profile_banner_url] || "http://placehold.it/794x397"
  self.tweets = auth[:extra][:raw_info][:statuses_count]
 	self.save!
 	self
 end

  def tweet(tweet)
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.configuration.twitter[:twitter_key]
      config.consumer_secret     = Rails.configuration.twitter[:twitter_secret]
      config.access_token        = token
      config.access_token_secret = token_secret
    end
    
    client.update(tweet)
  end
end

