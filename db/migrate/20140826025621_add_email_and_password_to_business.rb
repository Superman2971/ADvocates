class AddEmailAndPasswordToBusiness < ActiveRecord::Migration
  def change
    add_column :businesses, :email, :string
    add_column :businesses, :password_digest, :string
  end
end
