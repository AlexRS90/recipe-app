class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food

  validates :quantity, presence: { message: 'must be empty =D'}
  validates :quantity, numericality: true
end
