require 'rails_helper'

RSpec.describe Dish, type: :model do
  let!(:chef_amy) {Chef.create!(name:'Amy')}
  let!(:spaghetti) {chef_amy.dishes.create!(name:'Spaghetti', description: 'Pasta with marinara and chicken.')}
  let!(:chicken_fingers) {chef_amy.dishes.create!(name:'chicken_fingers', description: 'chicken with fried bread')}


  let!(:pasta) {Ingredient.create!(name:'pasta', calories: 150)}
  let!(:marinara) {Ingredient.create!(name:'marinara', calories: 100)}
  let!(:chicken) {Ingredient.create!(name:'chicken', calories: 125)}

  let!(:spaghetti_chicken) {DishIngredient.create!(dish_id: spaghetti.id, ingredient_id: chicken.id)}
  let!(:spaghetti_pasta) {DishIngredient.create!(dish_id: spaghetti.id, ingredient_id: pasta.id)}
  let!(:spaghetti_marinara) {DishIngredient.create!(dish_id: spaghetti.id, ingredient_id: marinara.id)}

  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end

  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :dish_ingredients}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe '.total_calories' do
    it 'It counts total number of calories in a dish' do within("#dish-info") do
      expect(spaghetti.total_calories).to eq(375)
    end
  end
end