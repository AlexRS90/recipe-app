require 'rails_helper'

RSpec.describe Food, type: :model do
  let(:user) do
    User.create!(name: 'Prom Prom', email: 'prom@gmail.com', password: '123456')
  end

  subject do
    Food.new(user: user, name: 'Plantain', measurement_unit: 'grams', price: 10)
  end

  before { subject.save }

  it 'a new food entry gets added' do
    expect(Food.count).to eq(1)
  end

  it 'expects name to not be empty' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'expects measurement_unit to not be empty' do
    subject.measurement_unit = nil
    expect(subject).to_not be_valid
  end

  it 'expects price to not be empty' do
    subject.price = nil
    expect(subject).to_not be_valid
  end

  it 'expects price to be integer' do
    subject.price = 'dkf'
    expect(subject).to_not be_valid
  end
end
