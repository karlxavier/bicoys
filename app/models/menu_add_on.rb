class MenuAddOn < ApplicationRecord
	belongs_to :menu
	has_many :menu_add_on_details
end
