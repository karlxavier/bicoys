class RenameDriverTable < ActiveRecord::Migration[5.0]
  def change
  	rename_table :drviers, :drivers
  end
end
