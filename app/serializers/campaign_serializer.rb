class CampaignSerializer < ActiveModel::Serializer
  attributes :id, :name, :status, :avatar_file_name, :followers, :location
end
