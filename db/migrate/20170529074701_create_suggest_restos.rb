class CreateSuggestRestos < ActiveRecord::Migration[5.0]
  def change
    create_table :suggest_restos do |t|
      t.string :name
      t.string :address
      t.string :detailed_address
      t.string :phone
      t.float :latitude
      t.float :longitude
      t.integer :restaurant_type_id
      t.integer :user_id
      t.integer :status

      t.timestamps
    end
  end
end
