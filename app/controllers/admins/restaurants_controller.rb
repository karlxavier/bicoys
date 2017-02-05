class Admins::RestaurantsController < ApplicationController
	before_action :authenticate_admin!

	def index
	end

	def new
		@restaurant = Restaurant.new
	end

	def create
		@restaurant = Restaurant.create(restaurant_params)

		respond_to do |format|
			if @restaurant.save
				format.html {  }
			end
		end
	end

	def edit
	end

	def update
	end

	private

		def restaurant_params
			require(:restaraunt).permit(:name, :address, :phone, :fax, :website, :active, :latitude, :longitude)
		end
end
