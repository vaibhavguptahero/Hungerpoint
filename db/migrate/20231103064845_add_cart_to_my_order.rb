class AddCartToMyOrder < ActiveRecord::Migration[7.0]
  def change
    add_reference :my_orders, :cart, foreign_key: true
  end
end
