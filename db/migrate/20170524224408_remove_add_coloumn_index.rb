class RemoveAddColoumnIndex < ActiveRecord::Migration[5.0]
  def change
  	remove_column :menu_categories, :restaurant_id
  	add_column :menu_categories, :restaurant_id, :integer
  end
end
