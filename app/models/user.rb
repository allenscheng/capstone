class User < ApplicationRecord
  has_many :wish_lists 
  has_many :daily_deals

  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
