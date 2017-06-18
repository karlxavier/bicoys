class AddAreaCodeToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :area_code, :string
  end
end
