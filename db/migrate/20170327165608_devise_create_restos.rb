class DeviseCreateRestos < ActiveRecord::Migration[5.0]
  def change
    create_table :restos do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :fullname
      t.integer :restaurant_id
      t.integer :resto_status_id, default: 1

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip

      t.timestamps null: false
    end

    add_index :restos, :email,                unique: true
    add_index :restos, :reset_password_token, unique: true
    # add_index :restos, :confirmation_token,   unique: true
    # add_index :restos, :unlock_token,         unique: true
  end
end
