class AddColumnMobileNoToResto < ActiveRecord::Migration[5.0]
  def change
    add_column :restos, :mobile_no, :string
  end
end
