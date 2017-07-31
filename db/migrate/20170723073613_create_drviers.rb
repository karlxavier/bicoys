class CreateDrviers < ActiveRecord::Migration[5.0]
  def change
    create_table :drviers do |t|
      t.string :name
      t.string :driver_license
      t.string :aka
      t.string :driver_image
      t.integer :driver_status_id

      t.timestamps
    end
  end
end
