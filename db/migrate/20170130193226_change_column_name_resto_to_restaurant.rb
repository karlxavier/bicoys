class ChangeColumnNameRestoToRestaurant < ActiveRecord::Migration[5.0]
  def change
  	rename_column :menus, :resto_id, :restaurant_id
  	rename_column :orders, :resto_id, :restaurant_id
  end
end
