class IngredientsController < ApplicationController
  def new
    @ingredient = RecipeFood.new
    @foods = Food.all
    @recipe = Recipe.find_by_id(params[:id])
  end
end
