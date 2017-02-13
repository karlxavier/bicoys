class Admins::RestaurantImagesController < ApplicationController

	def create
		puts '******************'
		@restaurant_image = RestaurantImage.new(restaurant_image_params)
		@restaurant_image.save
	end

	private

	def restaurant_image_params
		params.require(:restaurant_image).permit(:id, :image, :restaurant_id)
	end

end
