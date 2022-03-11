class ShoppingListController < ApplicationController
  def index
    @inventory = Inventory.find_by(user_id: current_user.id)
    @recipe = Recipe.find_by_id(params[:id])
    @ingredients = RecipeFood.where(recipe_id: params[:id]).includes(:food)
    @inventories_food = InventoryFood.where(inventory_id: @inventory.id).includes(:food)
    @shopping_list = []

    @ingredients.each do |recipe|
      flag = false
      @inventories_food.each do |food|
        next unless recipe.food_id == food.food_id

        flag = true

        next unless recipe.quantity > food.quantity

        @shopping_list.push({ food_name: food.food.name,
                              missing_food: "#{recipe.quantity - food.quantity} #{recipe.food.measurement_unit}",
                              cost: (recipe.quantity - food.quantity) * food.food.price })
      end
      next unless flag == false

      @shopping_list.push({ food_name: recipe.food.name,
                            missing_food: "#{recipe.quantity} #{recipe.food.measurement_unit}",
                            cost: recipe.quantity * recipe.food.price })
    end
  end
end
