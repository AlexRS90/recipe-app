class ShoppingListController < ApplicationController
  def index
    @recipe = Recipe.find_by_id(params[:id])
    @ingredients = @recipe.foods
  end
end
