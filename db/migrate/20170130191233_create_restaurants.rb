class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :fax
      t.string :website
      t.boolean :active
      t.decimal :minimum_order, precision: 12, scale: 3
      t.float :latitude
      t.float :longitude
      t.decimal :commission_percentage, precision: 12, scale: 3
      t.integer :resto_type_id

      t.timestamps
    end
  end
end
