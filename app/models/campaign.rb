class Campaign < ActiveRecord::Base
  belongs_to :business, class_name: "Business", foreign_key: :business_id, inverse_of: :campaigns
  has_many :campaign_users
  has_many :users, through: :campaign_users
end
