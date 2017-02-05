class Admins::RestaurantsController < ApplicationController
	before_action :authenticate_admin!

	def index
		@restaurants = Restaurant.all
	end

	def new
		@restaurant = Restaurant.new
	end

	def create
		@restaurant = Restaurant.new(restaurant_params)

		respond_to do |format|
			if @restaurant.save
				format.html { redirect_to admins_restaurants_path }
			else
				format.html { render 'new' }
			end
		end
	end

	def edit
	end

	def update
	end

	private

		def restaurant_params
			params.require(:restaurant).permit(:name, :address, :phone, :fax, :website, :active, :latitude, :longitude)
		end
end
