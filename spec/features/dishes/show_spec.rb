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

  let!(:spaghetti) {chef_amy.dishes.create!(name:'Spaghetti', description: 'Pasta with marinara and chicken.')}
  let!(:mac_n_cheese) {chef_amy.dishes.create!(name:'macaroni and cheese', description: 'pasta with cheese')}
  let!(:chicken_fingers) {chef_amy.dishes.create!(name:'chicken_fingers', description: 'chicken with fried bread')}
 
  let!(:cheese) {Ingredient.create!(name:'cheese', calories: 200)}
  let!(:pasta) {Ingredient.create!(name:'pasta', calories: 150)}
  let!(:marinara) {Ingredient.create!(name:'marinara', calories: 100)}
  let!(:chicken) {Ingredient.create!(name:'chicken', calories: 125)}
  let!(:bread_crumbs) {Ingredient.create!(name:'bread crumbs', calories: 90)}

  let!(:spaghetti_chicken) {DishIngredient.create!(dish_id: spaghetti.id, ingredient_id: chicken.id)}
  let!(:spaghetti_pasta) {DishIngredient.create!(dish_id: spaghetti.id, ingredient_id: pasta.id)}
  let!(:spaghetti_marinara) {DishIngredient.create!(dish_id: spaghetti.id, ingredient_id: marinara.id)}
  let!(:chicken_fingers_chicken) {DishIngredient.create!(dish_id: chicken_fingers.id, ingredient_id: chicken.id)}
  let!(:chicken_fingers_bread_crumbs) {DishIngredient.create!(dish_id: chicken_fingers.id, ingredient_id: bread_crumbs.id)}

  describe "User Story 1 When I visit a dish's show page" do
    it 'I see the dish’s name and description and I see a list of ingredients for that dish' do
      visit "dishes/#{spaghetti.id}"
     

      within "h1" do
        expect(page).to have_content('Dish Show Page')
      end

      within("#dish-info") do
      expect(page).to have_content('Name: Spaghetti')
      expect(page).to have_content('Description: Pasta with marinara and chicken.')
      end
      within(".ingredient-list") do
      expect(page).to have_content('Ingredient List:')
      expect(page).to have_content('pasta')
      expect(page).to have_content('marinara')
      expect(page).to have_content('chicken')
      end 
    end
    it "I see a total calorie count for that dish and I see the chef's name." do
      visit "dishes/#{spaghetti.id}"
      save_and_open_page

      within("#dish-info") do
      expect(page).to have_content('Chef: Amy')
      expect(page).to have_content('Calories: 375')
      end
    end
  end
end