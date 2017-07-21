class AddColumnDeliverNotesToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :delivery_notes, :string
    remove_column :orders, :wizard
  end
end
