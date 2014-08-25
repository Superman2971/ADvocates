class CreateCampaignUsers < ActiveRecord::Migration
  def change
    create_table :campaign_users do |t|
      t.references :campaign, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
