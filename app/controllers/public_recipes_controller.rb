class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.where(public: true).includes(:foods)
  end
end
