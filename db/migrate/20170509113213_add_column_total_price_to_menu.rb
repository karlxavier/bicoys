class AddColumnTotalPriceToMenu < ActiveRecord::Migration[5.0]
  def change
    add_column :menus, :total_price, :decimal,            precision: 12, scale: 3
  end
end
