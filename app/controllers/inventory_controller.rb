class InventoryController < ApplicationController
  def index
    if Inventory.find_by(user_id: current_user.id).present?
      @has_inv = true
      @inventory = Inventory.find_by(user_id: current_user.id)
    else
      @has_inv = false
      @inventory = Inventory.new
    end
  end

  def create
    @inventory = Inventory.new(name: inventory_params[:name], user_id: current_user.id)
    if @inventory.save
      flash[:success] = "Awesome, now we can manage your #{inventory_params[:name]}'s inventory! =D"
    else
      flash[:error] = @inventory.errors.full_messages
    end
    redirect_to inventory_path
  end

  def show
    @populate = InventoryFood.new
    @inventory = Inventory.find_by_id(params[:inventory_id])
    @foods = Food.where(user_id: current_user.id)
    @inventory_foods = @inventory.foods
  end

  def populate_inventory
    inventory = Inventory.find_by_id(params[:inventory_id])
    @populate = InventoryFood.new(inventory_id: inventory.id, food_id: populate_params[:food],
                                  quantity: populate_params[:quantity])
    if @populate.save
      flash[:success] = 'New food added succesfully =D'
    else
      flash[:error] = @populate.errors.full_messages
    end
    redirect_to "/inventory/#{inventory.id}"
  end

  def destroy_populate
    @populate = InventoryFood.find_by_id(params[:inv_food_id])
    if @populate.destroy
      flash[:success] = 'Food removed successfully =D'
    else
      flash[:error] = 'Error: Food was not removed =('
    end
    redirect_to "/inventory/#{params[:inventory_id]}"
  end

  def destroy
    @inventory = Inventory.find_by_id(params[:inventory_id])
    if @inventory.destroy
      flash[:success] = 'Inventory removed successfully =D'
    else
      flash[:error] = 'Error: Inventory could not be removed =('
    end
    redirect_to '/inventory'
  end

  private

  def inventory_params
    params.require(:data).permit(:name)
  end

  def populate_params
    params.require(:data).permit(:food, :quantity)
  end
end
