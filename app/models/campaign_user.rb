class CampaignUser < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :user
end
