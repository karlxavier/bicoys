class CreateRestoTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :resto_types do |t|
      t.string :RType

      t.timestamps
    end
  end
end
