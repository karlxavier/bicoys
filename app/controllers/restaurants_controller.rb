class RestaurantsController < ApplicationController
	around_filter :catch_not_found
	before_action :set_resto, except: [:index, :set_user_location]
	before_action :set_order, except: [:index, :set_user_location, :change_user_location, :user_location]
	before_action :get_user_location, only: [:show]

	def index	
		@restaurants = Restaurant.all
	end

	def show
		@menu_cats = MenuCategory.menu_cats(@restaurant.id)
		@order_item = @order.order_items.new
		session[:restaurant_id] = @restaurant.id
		@user_address = @current_location
		@resto_rate = TariffRate.resto_rate(@user_address.distance_from_user).first
		@resto_stars = Rate.resto_stars(@restaurant.id).presence || 0 #if !Restaurant.resto_stars(@restaurant.id).nil?
		@voters_count = Rate.where(rateable_type: "Restaurant", rateable_id: @restaurant.id).count

		set_meta_tags :og => {
         	:title    => @restaurant.name,
          	:url => request.url,
          	:description	=> 'We will deliver right to your door step!',
          	:image    => @restaurant.profile_image.url(:web) || 'https://hh2.herokuapp.com/assets/default_menu-7f7911460fd09a199d27ee44aed20aee1d5c50c93dd8f3e371bccbbbeabc801b.png'
        }
	end

	def user_location
		@user_address = UserAddress.where(id: session[:user_address_id]).first
		if @user_address
			@distance = Geocoder::Calculations.distance_between([@restaurant.latitude,@restaurant.longitude], [@user_address.latitude,@user_address.longitude]).round(1)
			@resto_rate = TariffRate.resto_rate(@distance).first
			respond_to do |format|
				format.html { render 'restaurants/user_location' }
			end
		end
	end

	def change_user_location
		user_address = UserAddress.where(id: session[:user_address_id]).first
		user_address.destroy if user_address
		session[:user_address_id] = nil

		redirect_to user_location_restaurant_path(@restaurant)
		# respond_to do |format|
		# 	format.html { render 'restaurants/user_location' }
		# end
	end

	def set_user_location
		@restaurant = Restaurant.find(session[:restaurant_id])
		if !params[:lat].nil? && !params[:lng].nil?
			@distance = Geocoder::Calculations.distance_between([@restaurant.latitude,@restaurant.longitude], [params[:lat],params[:lng]]).round(1) * 1.609
			@distance = @distance.round(1) 

			if @distance > 15 && @distance.present? # <------- check if its null also
				session[:user_address_id]
				params[:lat] = nil
				params[:lng] = nil

				user_address = UserAddress.where(id: session[:user_address_id]).first
				user_address.destroy if user_address
				session[:user_address_id] = nil

				@resto_rate = TariffRate.resto_rate(@distance).first
				respond_to do |format|
					format.js { render 'restaurants/error_msg' }
				end	
			else
				puts session[:user_address_id]
				@address = params[:add]
				@address.gsub! /"/, ''

				@user_address = current_location
				@user_address.user = current_user
				@user_address.full_address = @address
				@user_address.latitude = params[:lat]
				@user_address.longitude = params[:lng]
				@user_address.distance_from_user = @distance

				respond_to do |format|
					if !@user_address.persisted?
						if @user_address.save
							session[:user_address_id] = @user_address.id
							@resto_rate = TariffRate.resto_rate(@distance).first
							format.js
						else
							if @user_address.errors.any?
								@user_address.errors.full_messages.each do |message|
							   	puts message
							  end
							end
						end
					else
						if @user_address.update(user: current_user,full_address: @address, latitude: params[:lat], longitude: params[:lng],distance_from_user: @distance)
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
		@restaurant = Restaurant.resto_wd_images(params[:id]).first
		if @restaurant.blank?
			redirect_to err_404_path
		end	
	end

	def set_order
		@order = current_order
	end

	def get_user_location
		session[:restaurant_id] =  @restaurant.id
		@current_location = current_location
		if @current_location.full_address.nil?
			redirect_to user_location_restaurant_path(@restaurant)
		end
	end

	def user_add_params
		params.require(:user_address).permit(:user_id,:full_address,:latitude,:longitude,:distance_from_user)
	end

	def catch_not_found
	  yield
	rescue ActiveRecord::RecordNotFound
	  redirect_to root_url, :flash => { :error => "Record not found." }
	end

end
