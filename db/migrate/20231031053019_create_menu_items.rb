class CreateMenuItems < ActiveRecord::Migration[7.0]
  def change
    create_table :menu_items do |t|
      t.string :name
      t.integer :price
      t.references :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
