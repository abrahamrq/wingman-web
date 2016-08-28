# == Schema Information
#
# Table name: interests_users
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  preference_id :integer
#

class InterestsUser < ActiveRecord::Base
  belongs_to :user, inverse_of: :interest_users
  belongs_to :interest, inverse_of: :interest_users
end
