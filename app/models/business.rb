class Business < ActiveRecord::Base
  include ActiveModel::SecurePassword
  has_many :campaigns, class_name: "Campaign", foreign_key: :business_id, inverse_of: :business
  has_secure_password
end
