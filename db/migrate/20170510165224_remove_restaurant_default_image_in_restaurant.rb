class RemoveRestaurantDefaultImageInRestaurant < ActiveRecord::Migration[5.0]
  def change
  	change_column_default(:restaurants, :profile_image, nil)
  end
end
