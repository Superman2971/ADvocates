class AddTwitterPostFeaturesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :token, :string
    add_column :users, :token_secret, :string
    add_column :users, :followers, :integer
  end
end
