# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime
#  updated_at :datetime
#  fs_key     :string
#

class Category < ActiveRecord::Base
  has_many :interests, inverse_of: :category
end
