class InterestsUser < ActiveRecord::Base
  belongs_to :user, inverse_of: :interest_users
  belongs_to :interest, inverse_of: :interest_users
end