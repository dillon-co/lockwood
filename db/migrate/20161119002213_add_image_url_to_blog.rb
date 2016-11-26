class AddImageUrlToBlog < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :video_image_url, :string
  end
end
