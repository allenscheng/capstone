class AddPaperclipAttachment < ActiveRecord::Migration[5.1]
  def change
    add_attachment :wish_lists, :image
  end
end
