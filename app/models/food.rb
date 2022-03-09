class Food < ApplicationRecord
  belongs_to :user
  has_many :ingredients

  validates :name, presence: { message: 'must not be empty' }
  validates :measurement_unit, presence: { message: 'must not be empty' }
  validates :price, presence: { message: 'must not be empty' }
  validates :price, numericality: true
end
