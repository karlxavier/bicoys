class Restos::RestaurantsController < ApplicationController
	before_action :authenticate_resto!
	before_action :set_restaurant

	def index
	end

	def restodb
		@restaurant = Restaurant.find(@restaurant.id)
		@resto_stars = Rate.resto_stars(@restaurant.id)
		@voters_count = Rate.where(rateable_type: "Restaurant", rateable_id: @restaurant.id).count
	end

	private

		def set_restaurant
			@restaurant = Restaurant.find(current_resto.restaurant_id)
		end

end
