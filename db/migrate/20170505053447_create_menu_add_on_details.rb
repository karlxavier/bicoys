class CreateMenuAddOnDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :menu_add_on_details do |t|
      t.integer :menu_add_on_id
      t.string :name
      t.decimal :price,          precision: 30, scale: 10

      t.timestamps
    end
  end
end
