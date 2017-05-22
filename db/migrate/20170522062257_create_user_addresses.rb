class CreateUserAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :user_addresses do |t|
      t.integer :user_id
      t.string :full_address
      t.integer :address_type
      t.string :house_number
      t.string :street_name
      t.string :barangay_subdv
      t.text :additional_directions
      t.string :company_name
      t.string :building_number
      t.string :building_name
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
