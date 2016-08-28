# == Schema Information
#
# Table name: interests
#
#  id          :integer          not null, primary key
#  type        :string
#  description :string
#  fs_key      :string
#  category_id :integer
#

class Interest < ActiveRecord::Base
  belongs_to :category, inverse_of: :interests
  has_many :interests_users, inverse_of: :interest
  has_many :users, through: :interests_users, inverse_of: :interests
end
