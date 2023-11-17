class MyOrdersController < ApplicationController
  def index
    @my_orders=current_user.my_orders.order(created_at: :desc)
  end
end
