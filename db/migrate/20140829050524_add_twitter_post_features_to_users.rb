class AddTwitterPostFeaturesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :token, :string
    add_column :users, :token_secret, :string
    add_column :users, :followers, :string
    add_column :users, :screen_name, :string
    add_column :users, :friends, :string
    add_column :users, :background_image, :string
    add_column :users, :tweets, :string
  end
end
