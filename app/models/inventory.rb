class Inventory < ApplicationRecord
  belongs_to :user
  has_many :inventory_foods, dependent: :delete_all
  has_many :foods, through: :inventory_foods

  validates :name, presence: { message: 'must not be empty' }
end
