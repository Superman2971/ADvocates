class AddLocationToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :location, :string
  end
end
