class AddTweetCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :tweet_count, :integer
  end
end
