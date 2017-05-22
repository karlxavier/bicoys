class RestaurantsController < ApplicationController
	before_action :set_resto, except: [:index, :set_user_location]
	before_action :set_order, except: [:index, :set_user_location]
	before_action :get_user_location, only: [:show]

	def index
		@restaurants = Restaurant.all
	end

	def show
		@menus = Menu.resto_menus(params[:id])
		@menu_cats = MenuCategory.menu_cats(params[:id])
		@order_item = @order.order_items.new
		session[:restaurant_id] = params[:id]
	end

	def user_location
		@user_add = UserAddress.where(id: session[:user_address_id]).first

		if @user_add
			@distance = Geocoder::Calculations.distance_between([@restaurant.latitude,@restaurant.longitude], [@user_add.latitude,@user_add.longitude]).round(1)
			@resto_rate = TariffRate.resto_rate(@distance).first

			respond_to do |format|
				format.html { render 'restaurants/user_location' }
			end
		end
	end

	def set_user_location

		@restaurant = Restaurant.find(session[:restaurant_id])
		if !params[:lat].nil? && !params[:lng].nil?
			@distance = Geocoder::Calculations.distance_between([@restaurant.latitude,@restaurant.longitude], [params[:lat],params[:lng]]).round(1) * 1.60934
			@distance = @distance.round(1)
			if @distance > 15
				params[:lat] = nil
				params[:lng] = nil

				user_add = UserAddress.where(id: session[:user_address_id]).first
				user_add.destroy if user_add
				session[:user_address_id] = nil

				@resto_rate = TariffRate.resto_rate(@distance).first
				respond_to do |format|
					format.js { render 'restaurants/error_msg' }
				end	
			else
				@address = params[:add]
				@address.gsub! /"/, ''

				@user_address = current_location
				@user_address.user = current_user
				@user_address.full_address = @address
				@user_address.latitude = params[:lat]
				@user_address.longitude = params[:lng]

				respond_to do |format|
					if !@user_address.persisted?
						if @user_address.save
							session[:user_address_id] = @user_address.id
							@resto_rate = TariffRate.resto_rate(@distance).first
							format.js
						end
					else
						if @user_address.update(user: current_user,full_address: @address, latitude: params[:lat], longitude: params[:lng])
							session[:user_address_id] = @user_address.id
							@resto_rate = TariffRate.resto_rate(@distance).first
							format.js
						end
					end
				end	
			end
		end
	end

	private

	def set_resto
		@restaurant = Restaurant.find(params[:id])
	end

	def set_order
		@order = current_order
	end

	def get_user_location
		if current_location.nil?
			redirect_to user_location_restaurant_path(@restaurant)
		end
	end

	def user_add_params
		params.require(:user_address).permit(:user_id,:full_address,:latitude,:longitude)
	end



end
