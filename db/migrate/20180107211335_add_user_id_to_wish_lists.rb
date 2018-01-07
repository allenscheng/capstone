class AddUserIdToWishLists < ActiveRecord::Migration[5.1]
  def change
    add_column :wish_lists, :user_id, :integer
  end
end
