class RestaurantType < ApplicationRecord
	has_many :restaurants

	validates :RType, presence: true

end
