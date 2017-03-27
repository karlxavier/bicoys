class AddRestaurantToMenuCategories < ActiveRecord::Migration[5.0]
  def change
    add_reference :menu_categories, :restaurant, foreign_key: true
  end
end
