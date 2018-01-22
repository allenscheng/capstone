class AddImageToDailyDeals < ActiveRecord::Migration[5.1]
  def change
    add_column :daily_deals, :image, :string
  end
end
