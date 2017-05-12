class RestaurantsController < ApplicationController

	def show
		@restaurant = Restaurant.find(params[:id])
		@mymenus = @restaurant.menus.all
	end

end
