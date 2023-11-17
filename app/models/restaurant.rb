class Restaurant < ApplicationRecord
    has_many :menu_items
    has_many :comments
end
