class RenameColumnNameMenuName < ActiveRecord::Migration[5.0]
  def change
  	rename_column :menus, :menu_name, :name
  end
end
