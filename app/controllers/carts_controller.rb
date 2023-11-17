class CartsController < ApplicationController
  before_action :get_menu_item, only: [:update]
  before_action :ordered_cart, only: [:index, :update]
  def index
    unless current_user.carts.present? and !@ordered_cart.include?(current_user.carts.last.id)
      cart=current_user.carts.build
      cart.save
    end 
    @cart=current_user.carts.last
  end

  def update
    @restaurant=Restaurant.find(params[:restaurant_id])
    unless current_user.carts.present? and !@ordered_cart.include?(current_user.carts.last.id)
      @cart = Cart.create(user_id: current_user.id)
    else
      @cart=current_user.carts.last
    end
    @cart.total+=@menu_item.price
    @cart.save
    cart_item = CartItem.create(user_id: current_user.id, menu_item_id: @menu_item.id, cart_id: @cart.id) 
    flash[:notice]= "Item Added"
    redirect_to @restaurant
  end

  def cart_item_delete
    @cart_item= CartItem.find(params[:id])
    @cart = @cart_item.cart
    @cart.total -= @cart_item.menu_item.price
    @cart.save
    if @cart_item.destroy
      redirect_to carts_path
      flash[:notice]= "Successfully Remove item"
    else
    flash[:error]= "Not Remove item"
    end
  end

  def order
    @cart=Cart.find(params[:id])
    @my_order=MyOrder.new(user_id: current_user.id, cart_id: @cart.id, total: @cart.total, ordered_at: Date.today)
    @my_order.save
    cart = current_user.carts.build
    cart.save
    flash[:notice]= "Order Placed"
    redirect_to root_path
  end

  def reorder
    current_user.carts.last.destroy
    @cart=Cart.find(params[:id])
    @reorder=current_user.carts.build
    @reorder.total=@cart.total
    @reorder.save
    @cart.cart_items.each do |item|
      
      cart_item = CartItem.create(user_id: current_user.id, menu_item_id: item.menu_item.id, cart_id: @reorder.id) 
    end
    redirect_to carts_path
  end

  private

  def get_menu_item
    @menu_item = MenuItem.find(params[:id])
  end

  def ordered_cart
    @ordered_cart= MyOrder.pluck(:cart_id)
  end


end
