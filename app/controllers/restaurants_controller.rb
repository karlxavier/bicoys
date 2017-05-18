class RestaurantsController < ApplicationController
	before_action :set_resto, except: [:index]
	before_action :set_order, except: [:index]

	def index
		@restaurants = Restaurant.all
	end

	def show
		@menus = Menu.resto_menus(params[:id])
		@menu_cats = MenuCategory.menu_cats(params[:id])
		@order_item = @order.order_items.new
		session[:restaurant_id] = params[:id]
	end

	private

	def set_resto
		@restaurant = Restaurant.find(params[:id])
	end

	def set_order
		@order = current_order
	end

end
