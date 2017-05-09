class Restos::MenuCategoriesController < ApplicationController
	before_action :authenticate_resto!
	before_action :set_restaurant

	def index
		@menu_categories = @restaurant.menu_categories.all
	end

	def new
		@menu_category = MenuCategory.new
	end

	def create
		@menu_category = MenuCategory.new(menu_categories_params)
		@menu_category.restaurant = @restaurant
		if @menu_category.save
			redirect_to restos_path
		else
			render :new
		end
	end

	def edit
		@menu_category = MenuCategory.find(params[:id])
	end

	def update
		@menu_category = MenuCategory.find(params[:id])

		if @menu_category.update_attributes(menu_categories_params)
			redirect_to restos_restaurant_menu_categories_path(@restaurant)
		else
			render :edit
		end
	end

	private

		def set_restaurant
			@restaurant = Restaurant.find(params[:restaurant_id])
		end

		def menu_categories_params
			params.require(:menu_category).permit(:name, :restaurant_id)
		end

end
