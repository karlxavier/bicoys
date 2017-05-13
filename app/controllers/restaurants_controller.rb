class RestaurantsController < ApplicationController

	def show
		@restaurant = Restaurant.find(params[:id])
		@menus = Menu.resto_menus(params[:id])
		@menu_cats = MenuCategory.menu_cats(params[:id])
	end

end
