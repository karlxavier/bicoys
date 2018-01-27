class Restos::MenuCategoriesController < ApplicationController
	before_action :authenticate_resto!
	before_action :set_restaurant

	def index
		@menu_categories = @restaurant.menu_categories.all
					puts '***********'
			puts @menu_categories.count
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

	def destroy
		menu_category = @restaurant.menu_categories.find(params[:id])
		if menu_category.destroy
			redirect_to restos_restaurant_menu_categories_path(@restaurant)
		else
			render :index
		end
	end

	private

		def set_restaurant			
			@restaurant = Restaurant.where(slug: params[:restaurant_id]).first
		end

		def menu_categories_params
			params.require(:menu_category).permit(:name, :restaurant_id)
		end

end
