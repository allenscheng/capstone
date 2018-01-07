class AddUserIdToDailyDeals < ActiveRecord::Migration[5.1]
  def change
    add_column :daily_deals, :user_id, :integer
  end
end
