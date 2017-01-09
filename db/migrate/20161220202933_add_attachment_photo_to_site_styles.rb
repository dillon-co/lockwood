class AddAttachmentPhotoToSiteStyles < ActiveRecord::Migration
  def self.up
    change_table :site_styles do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :site_styles, :photo
  end
end
