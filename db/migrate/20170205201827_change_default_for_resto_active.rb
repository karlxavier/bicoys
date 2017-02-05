class ChangeDefaultForRestoActive < ActiveRecord::Migration[5.0]
  def change
  	change_column :restaurants, :active, :boolean, default: true
  end
end
