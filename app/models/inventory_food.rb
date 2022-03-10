class InventoryFood < ApplicationRecord
  belongs_to :inventory
  belongs_to :food

  validates :quantity, presence: { message: 'must be empty =D'}
  validates :quantity, numericality: true
end
