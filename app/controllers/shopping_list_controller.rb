class ShoppingListController < ApplicationController
  def index
    @recipe = Recipe.find(params[:id])
    @recipe_foods = @recipe.recipe_foods.includes(:food)
    @inventory = current_user.inventories.first
    @inventory_foods = @inventory.inventory_foods.includes(:food)
    @shopping_list = []

    @recipe_foods.each do |recipe_food|
      food_exists = false

      @inventory_foods.each do |inventory_food|
        next unless recipe_food.food_id == inventory_food.food_id

        food_exists = true

        next unless recipe_food.quantity > inventory_food.quantity

        @shopping_list.push({ food: inventory_food.food.name,
                              quantity: recipe_food.quantity - inventory_food.quantity,
                              price: recipe_food.food.price * (recipe_food.quantity - inventory_food.quantity) })
      end

      next if food_exists

      @shopping_list.push({ food: recipe_food.food.name,
                            quantity: recipe_food.quantity,
                            price: recipe_food.food.price * recipe_food.quantity })
    end
  end
end
