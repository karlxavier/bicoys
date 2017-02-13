class AddRestaurantToRetaurantImages < ActiveRecord::Migration[5.0]
  def change
  	remove_column :restaurant_images, :restaurant_id
    add_reference :restaurant_images, :restaurant, index: true
  end
end
