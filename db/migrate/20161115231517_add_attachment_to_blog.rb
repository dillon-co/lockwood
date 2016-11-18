class AddAttachmentToBlog < ActiveRecord::Migration[5.0]
  def up
    add_attachment :blogs, :photo
  end

  def down
    remove_attachment :blogs, :photo
  end
end
