class RestaurantType < ApplicationRecord
	has_many :restaurants

	validates :RType, presence: true

	scope :restos, -> (type_id) { includes(:restaurants).select('restaurant_types.id','restaurant_types."RType"').distinct.where(id: type_id) }

end
