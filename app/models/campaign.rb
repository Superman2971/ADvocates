class Campaign < ActiveRecord::Base
  belongs_to :business, class_name: "Business", foreign_key: :business_id, inverse_of: :campaigns
  has_many :campaign_users
  has_many :users, through: :campaign_users

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  validates_presence_of :name, :business_id, :status, :location, :followers
  validates :status, length: { maximum: 140 }
  validates_attachment :avatar, :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }
end