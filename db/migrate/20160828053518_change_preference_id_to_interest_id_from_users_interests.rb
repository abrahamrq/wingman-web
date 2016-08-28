class ChangePreferenceIdToInterestIdFromUsersInterests < ActiveRecord::Migration
  def change
    rename_column :interests_users, :preference_id, :interest_id
  end
end
