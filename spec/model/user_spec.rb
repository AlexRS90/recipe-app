require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Jenifa', email: 'jenifa@gmail.com', password: '123456') }

  before do
    User.create!(name: 'Prom Prom', email: 'prom@gmail.com', password: '123456')
    User.create!(name: 'Zoe', email: 'zoe@gmail.com', password: '123456')
    subject.save
  end

  it 'expects name to not be empty' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'has 3 users' do
    expect(User.count).to eq(3)
  end
end
