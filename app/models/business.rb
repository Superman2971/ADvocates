class Business < ActiveRecord::Base
  has_many :campaigns, class_name: "Campaign", foreign_key: :business_id, inverse_of: :business
end
