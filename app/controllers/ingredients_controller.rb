class IngredientsController < ApplicationController
  def new
    @ingredient = RecipeFood.new
    @foods = Food.all
    @recipe = Recipe.find_by_id(params[:id])
  end

  def create
    recipe = Recipe.find_by_id(params[:id])
    @ingredient = RecipeFood.new(recipe_id: recipe.id, food_id: ingredient_params[:food], quantity: ingredient_params[:quantity])
    if @ingredient.save
      flash[:success] = "New ingredient added succesfully! =D"
      redirect_to "/recipies/#{recipe.id}"
    else
      flash[:error] = @ingredient.errors.full_messages
      render :new
    end
  end

  private

  def ingredient_params
    params.require(:data).permit(:food, :quantity)
  end
end
