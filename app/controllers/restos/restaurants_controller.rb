class Restos::RestaurantsController < ApplicationController
	before_action :authenticate_resto!
	# before_action :set_restaurant, only: [:edit, :update, :show]

	# def index
	# end

	# def new
	# 	@menu = Menu.new
	# end

	# private

	# 	def set_restaurant
	# 		@restaurant = Restaurant.find(params[:restaurant_id])
	# 	end

end
