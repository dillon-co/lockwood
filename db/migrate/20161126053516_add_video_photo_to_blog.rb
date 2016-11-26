class AddVideoPhotoToBlog < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :video_photo, :string
  end
end
