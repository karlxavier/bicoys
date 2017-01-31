class CreateMenus < ActiveRecord::Migration[5.0]
  def change
    create_table :menus do |t|
      t.string :name
      t.string :description
      t.decimal :price, precision: 12, scale: 3
      t.boolean :active, default: true
      t.integer :resto_id
      t.integer :dish_type_id

      t.timestamps
    end
  end
end
