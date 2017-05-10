class RemoveColumnInRestaurant < ActiveRecord::Migration[5.0]
  def change
  	remove_column :restaurants, :profile_image
  	add_column :restaurants, :profile_image, :string
  end
end
