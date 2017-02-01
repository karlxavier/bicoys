class Restaurant < ApplicationRecord
	belongs_to :restaurant_type

	validates :name, :address, presence: true
end
