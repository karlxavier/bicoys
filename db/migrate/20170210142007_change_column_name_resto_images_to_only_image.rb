class ChangeColumnNameRestoImagesToOnlyImage < ActiveRecord::Migration[5.0]
  def change
  	rename_column :restaurant_images, :resto_image, :image
  end
end
