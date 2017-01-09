class CreateSiteStyles < ActiveRecord::Migration[5.0]
  def change
    create_table :site_styles do |t|

      t.integer :style_type
      t.string  :style_color

      t.timestamps
    end
  end
end
