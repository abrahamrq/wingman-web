class ChangeDateplanToPlural < ActiveRecord::Migration
  def change
    rename_table :dateplan, :dateplans
  end
end
