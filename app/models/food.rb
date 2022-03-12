class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods
  has_many :recipes, through: :recipe_foods
  has_many :inventory_foods
  has_many :inventories, through: :inventory_foods

  validates :name, presence: { message: 'must not be empty' }
  validates :measurement_unit, presence: { message: 'must not be empty' }
  validates :price, presence: { message: 'must not be empty' }
  validates :price, numericality: true
end
