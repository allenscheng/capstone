class RenamePriceToMsrpDailyDeals < ActiveRecord::Migration[5.1]
  def change
    rename_column :daily_deals, :price, :msrp
  end
end
