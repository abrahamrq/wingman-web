class Hstore < ActiveRecord::Migration
  def change
  	enable_extension "hstore"
  	remove_column :dateplans, :places
  	add_column :dateplans, :places, :hstore, array: true
  end
end
