class Recipe < ApplicationRecord
  validates :name, presence: { message: 'Kindly name this amazing dish!! =D' }
  validates :preparation_time, presence: { message: 'It\'d be nice if you tell us a preparation time =D' }
  validates :cooking_time, presence: { message: 'It\'d be nice if you tell us how many time needs to cooking =D' }
  validates :description, presence: { message: 'How do I have to mix the ingredients? =S' }

  belongs_to :user
  has_many :recipe_foods, dependent: :delete_all
  has_many :foods, through: :recipe_foods
end
