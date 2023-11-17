class AddCartToMenuItems < ActiveRecord::Migration[7.0]
  def change
    add_reference :menu_items, :cart, foreign_key: true
  end
end
