class AddKeyToCategory < ActiveRecord::Migration
  def change
    add_column :category, :fs_key, :string
  end
end
