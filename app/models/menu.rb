class Menu < ApplicationRecord
	belongs_to :restaurant
	belongs_to :dish_type

	validates :name
end
