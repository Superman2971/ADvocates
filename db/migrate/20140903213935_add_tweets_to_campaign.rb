class AddTweetsToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :tweets, :integer
  end
end
