class RemoveUserIdFromWishList < ActiveRecord::Migration[5.1]
  def change
    remove_column :wish_lists, :user_id, :integer
  end
end
