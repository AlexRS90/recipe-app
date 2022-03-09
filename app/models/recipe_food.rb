class RecipeFood < ApplicationRecord
  belongs_to :recipes
  belongs_to :foods
end
