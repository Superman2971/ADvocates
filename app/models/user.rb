class User < ActiveRecord::Base
  has_many :campaign_users
  has_many :campaigns, through: :campaign_users

  def self.from_omniauth(auth)
  	where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  end

 def self.create_from_omniauth(auth)
 	create! do |user|
 	user.provider = auth["provider"]
 	user.uid= auth["uid"]
 	user.name = auth["info"]["nickname"]
 	user.token = auth["credentials"]["token"]
 	user.secret = auth["credentials"]["secret"]
 end
end
end 
