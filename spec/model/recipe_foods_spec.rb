require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  let(:user) do
    User.create!(name: 'Prom Prom', email: 'prom@gmail.com', password: '123456')
  end

  let(:recipe) do
    Recipe.create!(name: 'Beans and Plantain',
                   preparation_time: '60 mins',
                   cooking_time: '90 mins',
                   description: 'The best beans and plantain recipe',
                   public: true,
                   user: user)
  end

  let(:food) do
    Food.create(user: user, name: 'Plantain', measurement_unit: 'grams', price: 10)
  end

  subject do
    RecipeFood.new(quantity: 4, recipe: recipe, food: food)
  end

  before { subject.save }

  it 'a new recipe entry gets added' do
    expect(RecipeFood.count).to eq(1)
  end

  it 'expects quantity to not be empty' do
    subject.quantity = nil
    expect(subject).to_not be_valid
  end

  it 'expects quantity to be integer' do
    subject.quantity = 'dkf'
    expect(subject).to_not be_valid
  end

  it 'recipe has-many foods through recipe-foods relationship' do
    expect(recipe.foods.count).to eq(1)
  end

  it 'foods has-many recipes through recipe-foods relationship' do
    expect(food.recipes.count).to eq(1)
  end
end
