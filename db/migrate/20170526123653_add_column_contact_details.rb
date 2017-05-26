class AddColumnContactDetails < ActiveRecord::Migration[5.0]
  def change
  	add_column :user_addresses, :mobile_number, :string
  	add_column :user_addresses, :landline_number, :string
  end
end
