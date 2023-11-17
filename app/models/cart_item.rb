class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :menu_item
  belongs_to :user

  def restrau_name
    menu_item.restaurant.name
  end

end
