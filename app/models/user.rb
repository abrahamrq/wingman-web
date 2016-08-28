# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  nickname   :string
#  gender     :string
#  email      :string
#  birthdate  :date
#  password   :string
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  has_many :dateplans, inverse_of: :user
  has_many :interests_users, inverse_of: :user
  has_many :interests, through: :interests_users, inverse_of: :users
end
