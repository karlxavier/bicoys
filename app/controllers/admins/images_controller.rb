class Admins::ImagesController < ApplicationController
	before_action :set_restaurant

  def new
    @restaurant = Restaurant.new
  end

  def create
    add_more_images(images_params[:images]))
    flash[:error] = "Failed uploading images" unless @restaurant.save
    redirect_to :back
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def add_more_images(new_images)
    images = @restaurant.images # copy the old images 
    images += new_images # concat old images with new ones
    @restaurant.images = images # assign back
  end

  def images_params
    params.require(:restaurant).permit({images: []}) # allow nested params as array
  end
end
