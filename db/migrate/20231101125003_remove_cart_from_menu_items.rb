class RemoveCartFromMenuItems < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :menu_items, :carts, name: "index_menu_items_on_cart_id"
    remove_column :menu_items, :cart_id 
  end
end
