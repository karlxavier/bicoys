class CreateMenuAddOns < ActiveRecord::Migration[5.0]
  def change
    create_table :menu_add_ons do |t|
      t.string :name
      t.integer :menu_id
      t.boolean :multiple_selection, default: false

      t.timestamps
    end
  end
end
