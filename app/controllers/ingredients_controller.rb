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

  def destroy
    recipe = Recipe.find(params[:id])
    @ingredient = RecipeFood.find_by_id(params[:ingredient_id])
    if @ingredient.destroy
      flash[:success] = "Ingredient removed successfully =D"
    else
      flash[:error] = 'Sorry, I can\'t removed it. =\'('
    end
    redirect_to "/recipies/#{recipe.id}"
  end

  private

  def ingredient_params
    params.require(:data).permit(:food, :quantity)
  end
end
