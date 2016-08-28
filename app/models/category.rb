class Category < ActiveRecord::Base
  has_many :interests, inverse_of: :category
end