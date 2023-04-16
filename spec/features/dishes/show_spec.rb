# As a visitor
# When I visit a dish's show page
# I see the dish’s name and description
# And I see a list of ingredients for that dish
# and a total calorie count for that dish
# And I see the chef's name.
# ```
require 'rails_helper'

RSpec.describe "dishes show page", type: :feature do

  let!(:chef_amy) {Chef.create!(name:'Amy')}

  let!(:spaghetti) {chef_amy.dishs.create!(name:'spaghetti', description: 'pasta with marinara and chicken ')}
  let!(:mac_n_cheese) {chef_amy.dishs.create!(name:'macaroni and cheese', description: 'pasta with cheese')}
  let!(:chicken_fingers) {chef_amy.dishs.create!(name:'chicken_fingers', description: 'chicken with fried bread')}
 
  let!(:cheese) {Ingredient.create!(name:'chees', calories: 200)}
  let!(:pasta) {Ingredient.create!(name:'pasta', calories: 150)}
  let!(:marinara) {Ingredient.create!(name:'marinara', calories: 100)}
  let!(:chicken) {Ingredient.create!(name:'chicken', calories: 125)}
  let!(:bread_crumbs) {Ingredient.create!(name:'bread crumbs', calories: 90)}

  let!(:spaghetti_ingredients) {DishIngredient.create!(dish_id: spaghetti.id, ingredient_id: chicken.id)}
  let!(:spaghetti_ingredients) {DishIngredient.create!(dish_id: spaghetti.id, ingredient_id: pasta.id)}
  let!(:spaghetti_ingredients) {DishIngredient.create!(dish_id: spaghetti.id, ingredient_id: marinara.id)}
  let!(:chicken_fingers_ingredients) {DishIngredient.create!(dish_id: chicken_fingers.id, ingredient_id: chicken.id)}
  let!(:chicken_fingers_ingredients) {DishIngredient.create!(dish_id: chicken_fingers.id, ingredient_id: bread_crumbs.id)}
