class MenuCategory < ApplicationRecord
	belongs_to :restaurant
	has_many :menus

	validates :name, :restaurant, presence: true
end
