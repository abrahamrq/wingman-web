class AddPasswordSaltHash < ActiveRecord::Migration
  def change
    remove_column :users, :password
    add_column :users, :password_salt, :string
    add_column :users, :password_hash, :string
  end
end
