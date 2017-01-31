class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.decimal :subtotal, precision: 12, scale: 3
      t.decimal :delivery_charge, precision: 12, scale: 3
      t.decimal :tax, precision: 12, scale: 3
      t.decimal :total, precision: 12, scale: 3
      t.integer :order_status_id
      t.integer :user_id
      t.integer :resto_id
      t.integer :payment_type_id

      t.timestamps
    end
  end
end
