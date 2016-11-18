class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.belongs_to :blog, index: true

      t.string :name
      
      t.timestamps
    end
  end
end
