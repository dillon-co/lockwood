class ChangeIngredientTable < ActiveRecord::Migration[5.0]
  def change
    change_column :ingredients, :rating, 'integer USING CAST(rating AS integer)'
  end
end
