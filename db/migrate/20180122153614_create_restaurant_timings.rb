class CreateRestaurantTimings < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurant_timings do |t|
    	t.integer :restaurant_id
      t.time :monday
      t.time :tuesday
      t.time :wednesday
      t.time :thursday
      t.time :friday
      t.time :saturday
      t.time :sunday

      t.timestamps
    end
  end
end
