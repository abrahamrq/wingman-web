class AddKeyToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :fs_key, :string
  end
end
