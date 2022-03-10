class ShoppingListController < ApplicationController
  def index
    @recipe = Recipe.find_by_id(params[:id])
    @ingredients = @recipe.foods.includes(:inventory_foods)
    @shopping_list = []

    # @ingredients.each do |ingredient|
    #   # if ingredient.inventory_foods.first.nil?
    #   #   @shopping_list << ingredient
    #   # end
    #   # p ingredient.recipe_foods.first.quantity
    #   # p ingredient.inventory_foods
    #   # if ingredient.recipe_foods.first.quantity < ingredient.inventory_foods.first.quantity
    #   #   @shopping_list << ingredient
    #   # end
    #   p 'THIS >>>', ingredient.inventory_foods.length

    #   if ingredient.inventory_foods.length.zero?
    #     @shopping_list << ingredient.name
    #   # elsif ingredient.recipe_foods.first.quantity < ingredient.inventory_foods.first.quantity
    #   #   @shopping_list << ingredient.name
    #   end
    # end
    p @shopping_list
  end
end
