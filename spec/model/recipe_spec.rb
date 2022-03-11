require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:user) do
    User.create!(name: 'Prom Prom', email: 'prom@gmail.com', password: '123456')
  end

  subject do
    Recipe.new(name: 'Beans and Plantain',
               preparation_time: '60 mins',
               cooking_time: '90 mins',
               description: 'The best beans and plantain recipe',
               public: true,
               user: user)
  end

  before { subject.save }

  it 'a new recipe entry gets added' do
    expect(Recipe.count).to eq(1)
  end

  it 'expects name to not be empty' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'expects preparation_time to not be empty' do
    subject.preparation_time = nil
    expect(subject).to_not be_valid
  end

  it 'expects cooking_time to not be empty' do
    subject.cooking_time = nil
    expect(subject).to_not be_valid
  end

  it 'expects description to be integer' do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it 'user has a recipe' do
    expect(user.recipes.count).to eq(1)
  end
end
