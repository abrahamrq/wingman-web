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

  validates :first_name, presence: true
  validates :last_name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: true }
  validates :password_hash, presence: true, on: :update
  validates :password_salt, presence: true, on: :update
  validates :password, presence: true, on: :create,
                       length: { in: 8..20 }

  attr_accessor :password

  before_create :encrypt

  def edit_interests(interest_ids)
    current_interests = self.interests.pluck(:id)
    create_interests(interest_ids - current_interests)
    delete_interests(current_interests - interest_ids)
  end

  private

  def create_interests(interest_ids)
    interest_ids.each do |i_id|
      InterestsUser.create(user_id: self.id, interest_id: i_id)
    end
  end

  def delete_interests(interest_ids)
    delete_interests_instances = interests_users.where(interest_id: interest_ids)
    delete_interests_instances.delete_all
  end

  def encrypt
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end
end
