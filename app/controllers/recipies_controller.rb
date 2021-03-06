class RecipiesController < ApplicationController
  def index
    @recipies = current_user.recipes
  end

  def new
    @recipe = Recipe.new
  end

  def show
    @recipe = Recipe.find_by_id(params[:id])
    @ingredients = @recipe.foods
    @owner = @recipe.user_id == current_user.id
    @inventory = current_user.inventories.any?
  end

  def create
    user = current_user.id if current_user
    @recipe = Recipe.new(user_id: user, name: recipe_params[:name], preparation_time: recipe_params[:preparation],
                         cooking_time: recipe_params[:cooking], description: recipe_params[:description],
                         public: recipe_params[:public] == '1')
    if @recipe.save
      flash[:success] = 'New recipe added successfully! =D'
      redirect_to '/recipies'
    else
      flash[:error] = @recipe.errors.full_messages
      # redirect_to '/recipies/new'
      render :new
    end
  end

  def destroy
    @recipe = Recipe.find_by_id(params[:id])
    if @recipe.destroy
      flash[:success] = 'Recipe removed successfully =D'
    else
      flash[:error] = 'Error: Recipe could not be removed =('
    end
    redirect_to '/recipies'
  end

  private

  def recipe_params
    params.require(:data).permit(:name, :preparation, :cooking, :description, :public)
  end
end
