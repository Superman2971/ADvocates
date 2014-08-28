class User < ActiveRecord::Base
  has_many :campaign_users
  has_many :campaigns, through: :campaign_users

  def self.find_or_create_with_omniauth(auth)
  	user = find_by(uid: auth.slice(:uid).uid) || initialize_from_omniauth(auth)
  	user.update_dynamic_attributes(auth)
  end

 def self.initialize_from_omniauth(auth)
 	new do |user|
 		user.provider = auth[:provider]
 		user.uid = auth[:uid]
 		user.name = auth[:info][:name]
 		user.save
 	end
 end

 # def update_dynamic_attributes(auth)
 # 	self.location = auth[:info][:location] 
 # 	self.image = auth[:info][:image] 
 # 	self.description = auth[:info][:description]
 # 	self.save!
 # 	self
 # end
end

