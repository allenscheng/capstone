class User < ApplicationRecord
  has_many :daily_deals
  has_many :wish_lists
  def as_json
    {
      first_name: first_name,
      last_name: last_name,
      email: email
    }
  end
end
