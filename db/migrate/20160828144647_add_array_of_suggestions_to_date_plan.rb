class AddArrayOfSuggestionsToDatePlan < ActiveRecord::Migration
  def change
    remove_column :dateplans, :places
    add_column :dateplans, :places, :text, array: true, default: []
  end
end
