# == Schema Information
#
# Table name: dateplans
#
#  id      :integer          not null, primary key
#  places  :string
#  title   :string
#  user_id :integer
#

class Dateplan < ActiveRecord::Base
  belongs_to :user, inverse_of: :dateplans
end
