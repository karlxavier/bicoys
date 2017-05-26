class AddMinOrderToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :min_order, :integer
  end
end
