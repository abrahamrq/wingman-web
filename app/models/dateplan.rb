class Dateplan < ActiveRecord::Base
  belongs_to :user, inverse_of: :dateplans
end