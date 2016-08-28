class Interest < ActiveRecord::Base
  belongs_to :category, inverse_of: :interests
  has_many :interests_users, inverse_of: :interest
  has_many :users, through: :interests_users, inverse_of: :interests
end