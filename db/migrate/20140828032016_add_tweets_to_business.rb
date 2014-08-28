class AddTweetsToBusiness < ActiveRecord::Migration
  def change
    add_column :businesses, :tweets, :integer, :default => 0
  end
end
