require 'rails_helper'

RSpec.describe Inventory, type: :model do
  let(:user) do
    User.create!(name: 'Prom Prom', email: 'prom@gmail.com', password: '123456')
  end

  let(:user2) do
    User.create!(name: 'Mikaila Prom', email: 'mikaila@gmail.com', password: '123456')
  end

  subject do
    Inventory.new(user: user2, name: 'Party')
  end

  before do
    Inventory.create(user: user, name: 'Kitchen')
    Inventory.create(user: user2, name: 'Party')
    subject.save
  end

  it 'users inventory count is accurate' do
    expect(user.inventories.count).to eq(1)
  end

  it 'a new inventory entry gets added' do
    expect(Inventory.count).to eq(3)
  end

  it 'name field must not be empty' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
