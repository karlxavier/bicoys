class Admins::MenusController < ApplicationController
	before_action :authenticate_admin!
	before_action :set_restaurant

	def index
	end

	def show
	end

	def new
	end

	def edit
	end

	def update
	end

	private
		def set_restaurant
			@restaurant = Restaurant.find(current_admin.restaurant_id)
		end
end
