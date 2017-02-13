class CreateRestaurantImages < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurant_images do |t|
      t.string :resto_image
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
