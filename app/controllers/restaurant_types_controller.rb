class RestaurantTypesController < ApplicationController

	def index
		@resto_recent = Restaurant.most_recent(4,1)
		@bake_recent = Restaurant.most_recent(4,2)
	end

end
