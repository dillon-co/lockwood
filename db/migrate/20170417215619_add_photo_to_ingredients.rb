class AddPhotoToIngredients < ActiveRecord::Migration[5.0]
  def up
   add_attachment :ingredients, :photo
 end

 def down
   remove_attachment :ingredients, :photo
 end
end
