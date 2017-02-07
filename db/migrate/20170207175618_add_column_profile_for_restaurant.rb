class AddColumnProfileForRestaurant < ActiveRecord::Migration[5.0]
  def change
  	add_column :restaurants, :profile_image, :string, array: true, default: []
  end
end
