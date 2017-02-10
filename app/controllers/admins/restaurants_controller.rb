class Admins::RestaurantsController < ApplicationController
	before_action :authenticate_admin!
	before_action :set_restaurant, only:[:edit, :update, :show]

	def index
		@restaurants = Restaurant.all
	end

	def show
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
		@restaurant = Restaurant.find(params[:id])
	end

	def update
		respond_to do |format|

			if @restaurant.update_attributes(restaurant_params)
				  if params[:images]
		        params[:images].each { |image|
		          puts image
		        }
		      end
				format.html { redirect_to admins_restaurants_path }
			else
				format.html { render 'edit' } 
			end
		end
	end

	private

		def restaurant_params
			params.require(:restaurant).permit(:name, :address, :phone, :fax, :website, :commission_percentage, :active, :latitude, :longitude, {images: []}, {profile_image: []})
		end

		def set_restaurant
			@restaurant = Restaurant.find(params[:id])
		end

end
