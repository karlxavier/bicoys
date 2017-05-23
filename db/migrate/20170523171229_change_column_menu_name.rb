class ChangeColumnMenuName < ActiveRecord::Migration[5.0]
  def change
  	rename_column :menus, :name, :menu_name
  end
end
