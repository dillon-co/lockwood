class CreateBlogs < ActiveRecord::Migration[5.0]
  def change
    create_table :blogs do |t|
      t.belongs_to :admin, index: true

      t.string :video
      t.string :title, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end
