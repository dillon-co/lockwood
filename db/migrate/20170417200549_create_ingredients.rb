class CreateIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :ingredients do |t|
      t.string :title
      t.text :description
      t.string :type
      t.string :rating

      t.timestamps
    end
  end
end
