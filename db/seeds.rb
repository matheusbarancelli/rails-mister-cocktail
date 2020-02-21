require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients = JSON.parse(ingredients_serialized)
ingredients["drinks"].each do |drink|
  i = Ingredient.new(name: drink["strIngredient1"])
  i.save!
end
