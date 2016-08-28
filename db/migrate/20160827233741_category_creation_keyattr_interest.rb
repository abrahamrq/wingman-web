class CategoryCreationKeyattrInterest < ActiveRecord::Migration
  def change
    add_column :interests, :fs_key, :string

    create_table :categories do |t|
      t.string :name
      t.timestamps
    end

    add_column :interests, :category_id, :integer, index: true
  end
end
