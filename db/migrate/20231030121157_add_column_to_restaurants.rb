class AddColumnToRestaurants < ActiveRecord::Migration[7.0]
  def change
    add_column :restaurants, :review, :string
  end
end
