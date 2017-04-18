json.extract! ingredient, :id, :title, :description, :type, :rating, :created_at, :updated_at
json.url ingredient_url(ingredient, format: :json)