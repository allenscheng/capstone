class CreateDailyDeals < ActiveRecord::Migration[5.1]
  def change
    create_table :daily_deals do |t|
      t.integer :user_id
      t.string :name
      t.text :description
      t.integer :price
      t.string :color
      t.string :product_link

      t.timestamps
    end
  end
end
