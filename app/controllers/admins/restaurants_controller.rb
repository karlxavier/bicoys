class Admins::RestaurantsController < ApplicationController
	before_action :authenticate_admin!
	before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

	def index
		@restaurants = Restaurant.all
	end

	def show
		@restaurant_images = @restaurant.restaurant_images
	end

	def new
		@restaurant = Restaurant.new
		# @restaurant.restaurant_images.build
	end

	def create
		@restaurant = Restaurant.new(restaurant_params)

		respond_to do |format|
			if @restaurant.save
				if params[:images]
			        params[:images].each { |image|
			         	@restaurant.restaurant_images.create(image: image)
			        }
			    end
				format.html { redirect_to admins_restaurants_path }
			else
				format.html { render 'new' }
			end
		end
	end

	def edit
	end

	def update
		# puts '***********************'
		# puts params[:profile_image]
		# @restaurant.profile_image = params[:pimage]
		respond_to do |format|
			if @restaurant.update_attributes(restaurant_params)
				if params[:images]
			        params[:images].each { |image|
			         	@restaurant.restaurant_images.create(image: image)
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
			# params.require(:restaurant).permit(:name, :address, :phone, :fax, :website, :commission_percentage, :active, :latitude, :longitude, restaurant_images_attributes: [:id, :restaurant_id, :image])
			params.require(:restaurant).permit(:name, :address, :phone, :fax, :website, :commission_percentage, :active, :latitude, :longitude, :profile_image)
		end

		def set_restaurant
			@restaurant = Restaurant.find(params[:id])
		end

end
