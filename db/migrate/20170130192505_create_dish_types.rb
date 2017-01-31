class CreateDishTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :dish_types do |t|
      t.string :DType

      t.timestamps
    end
  end
end
