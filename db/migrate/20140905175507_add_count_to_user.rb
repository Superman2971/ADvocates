class AddCountToUser < ActiveRecord::Migration
  def change
    add_column :users, :count, :integer, :default => 3
  end
end
