class AddFollowersToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :followers, :string
  end
end
