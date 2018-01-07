class CreateWishLists < ActiveRecord::Migration[5.1]
  def change
    create_table :wish_lists do |t|
      t.string :name
      t.string :product_link

      t.timestamps
    end
  end
end
