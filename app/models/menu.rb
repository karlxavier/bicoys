class Menu < ApplicationRecord
	belongs_to :restaurant
	belongs_to :menu_category

	validates :name, :price, presence: true
end
