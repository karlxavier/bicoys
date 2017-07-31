class CreateDriverStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :driver_statuses do |t|
      t.string :DStatus

      t.timestamps
    end
  end
end
