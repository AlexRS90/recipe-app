class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.where(public: true).includes(:foods, :user)
  end
end
