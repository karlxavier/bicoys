class AddImagesToRestaurant < ActiveRecord::Migration[5.0]
  def change
  	add_column :restaurants, :images, :string, array: true, default: []
  end
end
