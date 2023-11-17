class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items, dependent: :destroy
  has_one :my_order, dependent: :destroy
  def items
    cart_items.count
  end


end
