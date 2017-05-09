class AddColumnActiveToResto < ActiveRecord::Migration[5.0]
  def change
    add_column :restos, :active, :boolean, default: true
  end
end
