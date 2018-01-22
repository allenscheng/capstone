class AddImageToWishLists < ActiveRecord::Migration[5.1]
  def change
    add_column :wish_lists, :image, :string
  end
end
