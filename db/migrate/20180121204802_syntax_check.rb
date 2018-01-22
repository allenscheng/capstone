class SyntaxCheck < ActiveRecord::Migration[5.1]
  def change
    add_column :daily_deals, :status_check, :boolean, default: false
  end
end
