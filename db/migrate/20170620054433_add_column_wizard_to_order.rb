class AddColumnWizardToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :wizard, :integer
  end
end
