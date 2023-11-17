class MyOrder < ApplicationRecord
  belongs_to :user
  has_many :cart_items
  belongs_to :cart
end
