class IgredientsController < ApplicationController
  def new
    @ingredient = Ingredient.new
    @foods = Food.all
    @recipe = Recipe.find_by_id(params[:id])
  end

  def create
  end
end
