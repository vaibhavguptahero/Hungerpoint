class AddDateToMyOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :my_orders, :ordered_at, :datetime
  end
end
