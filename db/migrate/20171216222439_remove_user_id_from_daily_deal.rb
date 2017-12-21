class RemoveUserIdFromDailyDeal < ActiveRecord::Migration[5.1]
  def change
    remove_column :daily_deals, :user_id, :integer
  end
end
