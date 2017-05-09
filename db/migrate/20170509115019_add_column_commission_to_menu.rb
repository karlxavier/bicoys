class AddColumnCommissionToMenu < ActiveRecord::Migration[5.0]
  def change
    add_column :menus, :commission, :decimal,            precision: 12, scale: 3
  end
end
