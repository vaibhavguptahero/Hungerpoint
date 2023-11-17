class MenuItemsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @menu_item=MenuItem.new
  end

  def create
    @restaurant=Restaurant.find(params[:restaurant_id])
    @menu_item=@restaurant.menu_items.build(menu_item_params)
    if @menu_item.save
      flash[:notice] = "Successfully menu created"
      redirect_to restaurant_path(@restaurant)          
    else
        render 'new'
    end
  end

  def edit
  end

  private
  
  def menu_item_params
    params.require(:menu_item).permit(:name, :price)
  end

end
