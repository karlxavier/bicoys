class Restos::RestaurantsController < ApplicationController
	before_action :authenticate_resto!
	# before_action :set_restaurant, only: [:edit, :update, :show]

	def index
	end

	def restodb
		@restaurant = Restaurant.find(current_resto.restaurant_id)
		@resto_stars = Restaurant.resto_stars(@restaurant.id)
		@voters_count = Rate.where(rateable_type: "Restaurant", rateable_id: @restaurant.id).count
	end

end
