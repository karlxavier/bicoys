class CreateAdminRates < ActiveRecord::Migration[5.0]
  def change
    create_table :admin_rates do |t|
      t.integer :service_charge
      t.integer :discount_redeem

      t.timestamps
    end
  end
end
