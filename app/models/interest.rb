class Interest < ActiveRecord::Base
  has_many :interests_users, inverse_of: :interest
  has_many :users, through: :interests_users, inverse_of: :interests
end