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
      redirect_to inventory_path
    else
      flash[:error] = @inventory.errors.full_messages
      redirect_to inventory_path
    end
  end

  def show
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
end
