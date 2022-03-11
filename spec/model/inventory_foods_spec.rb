require 'rails_helper'

RSpec.describe InventoryFood, type: :model do
  let(:user) do
    User.create!(name: 'Prom Prom', email: 'prom@gmail.com', password: '123456')
  end

  let(:inventory) do
    Inventory.create!(user: user, name: 'Kitchen')
  end

  let(:food) do
    Food.create(user: user, name: 'Plantain', measurement_unit: 'grams', price: 10)
  end

  subject do
    InventoryFood.new(quantity: 4, inventory: inventory, food: food)
  end

  before { subject.save }

  it 'a new recipe entry gets added' do
    expect(InventoryFood.count).to eq(1)
  end

  it 'expects quantity to not be empty' do
    subject.quantity = nil
    expect(subject).to_not be_valid
  end

  it 'expects quantity to be integer' do
    subject.quantity = 'dkf'
    expect(subject).to_not be_valid
  end

  it 'inventory has-many foods through inventory-foods relationship' do
    expect(inventory.foods.count).to eq(1)
  end

  it 'foods has-many inventories through inventory-foods relationship' do
    expect(food.inventories.count).to eq(1)
  end
end
