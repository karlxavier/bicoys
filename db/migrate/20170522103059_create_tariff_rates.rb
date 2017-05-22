class CreateTariffRates < ActiveRecord::Migration[5.0]
  def change
    create_table :tariff_rates do |t|
      t.decimal :min_km, precision: 12, scale: 3
      t.decimal :max_km, precision: 12, scale: 3
      t.integer :min_order
      t.integer :service_charge
      t.string :eta_delivery

      t.timestamps
    end
  end
end
