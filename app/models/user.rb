class User < ActiveRecord::Base
  has_many :campaign_users
  has_many :campaigns, through: :campaign_users
end
