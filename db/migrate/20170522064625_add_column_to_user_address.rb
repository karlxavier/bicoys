class AddColumnToUserAddress < ActiveRecord::Migration[5.0]
  def change
    add_column :user_addresses, :last_used, :boolean, default: false
  end
end
