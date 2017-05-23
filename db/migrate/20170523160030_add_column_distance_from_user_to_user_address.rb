class AddColumnDistanceFromUserToUserAddress < ActiveRecord::Migration[5.0]
  def change
    add_column :user_addresses, :distance_from_user, :decimal, precision: 12, scale: 3
  end
end
