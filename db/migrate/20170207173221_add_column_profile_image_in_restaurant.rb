class AddColumnProfileImageInRestaurant < ActiveRecord::Migration[5.0]
  def change
  	add_column :restaurants, :profile_image, :string
  end
end
