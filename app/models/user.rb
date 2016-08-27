class User < ActiveRecord::Base
  has_many :dateplans, inverse_of: :user
  has_many :interests_users, inverse_of: :user
  has_many :interests, through: :interests_users, inverse_of: :users
end