class RestaurantType < ApplicationRecord
	has_many :restaurants

	validates :RType, presence: true

	scope :restos, -> (type_id) { includes(:restaurants).select('restaurant_types.id','restaurant_types."RType"').distinct.where(id: type_id) }
	scope :resto_search, -> (type_id, search) { includes(:restaurants).select('restaurant_types.id','restaurant_types."RType"').references(:restaurants).distinct.where("restaurant_types.id = ? AND restaurants.name ILIKE ?", type_id, resto_search) }

end
