class ChangeTableNameRestoTypeToRestaurantType < ActiveRecord::Migration[5.0]
  def change
  	rename_table :resto_types, :restaurant_types
  	rename_column :restaurants, :resto_type_id, :restaurant_type_id
  end
end
