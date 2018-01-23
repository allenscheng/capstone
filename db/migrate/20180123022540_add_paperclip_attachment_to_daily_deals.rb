class AddPaperclipAttachmentToDailyDeals < ActiveRecord::Migration[5.1]
  def change
    add_attachment :daily_deals, :image
  end
end
