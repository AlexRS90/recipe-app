class FoodsController < ApplicationController
  before_action :set_food, only: %i[show destroy]

  def index
    @foods = Food.all
  end

  def destroy
    @food.delete
    redirect_to foods_path, notice: "#{@food.name} deleted successfully"
  end

  private

  def set_food
    @food = Food.find(params[:id])
  end

  def food_params
    params.require(:food).permit(:user_id, :name, :measurement_unit, :price)
  end
end
