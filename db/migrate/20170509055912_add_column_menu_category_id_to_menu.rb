class AddColumnMenuCategoryIdToMenu < ActiveRecord::Migration[5.0]
  def change
    add_column :menus, :menu_category_id, :integer
  end
end
