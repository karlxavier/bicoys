class ChangeColumnProfileImageAsArray < ActiveRecord::Migration[5.0]
  def change
  	remove_column :restaurants, :profile_image
  	# change_column :restaurants, :profile_image, :string, array: true, default: []
  end
end
