class RestaurantTypesController < ApplicationController
	before_filter :allow_iframe_requests

	def index
		@resto_recent = Restaurant.most_recent(5,1)
		@bake_recent = Restaurant.most_recent(5,2)
		@cater_recent = Restaurant.most_recent(5,3)

		@resto_orders = Restaurant.most_orders(5,1)
		@bake_orders = Restaurant.most_orders(5,2)
		@cater_orders = Restaurant.most_orders(5,3)

		@user_address = UserAddress.where(id: session[:user_address_id]).first
		@last_order = Order.last_order

		if @user_address
			distance = Geocoder::Calculations.distance_between([7.065547,125.608295], [@user_address.latitude,@user_address.longitude]).round(1)
			respond_to do |format|
				format.html
			end
		end
	end

	def show
		# @current_order = current_order
		if !params[:search].blank?
			respond_to do |format|
				@restos = Restaurant.resto_search(params[:id], params[:search])
				if @restos
					format.js { render 'each_restaurants' }
				else
					@restos = RestaurantType.restos(params[:id])
					format.js { render 'each_restaurants' }
				end
			end
		else
			respond_to do |format|
				if request.format.to_s == 'text/html' # <-------- STILL NEEDS TO IMPROVE
					@restos = RestaurantType.restos(params[:id])
					format.html { render 'show' }
				else
					@restos = Restaurant.where(restaurant_type_id: params[:id])
					format.js { render 'each_restaurants' }
				end
			end
		end
	end

	def user_location
		if !params[:lat].nil? && !params[:lng].nil?
			distance = Geocoder::Calculations.distance_between([7.065547,125.608295], [params[:lat],params[:lng]]).round(1) * 1.609
			distance = distance.round(1) 
			if distance > 16
				params[:lat] = nil
				params[:lng] = nil

				@user_address = UserAddress.where(id: session[:user_address_id]).first
				@user_address.destroy if @user_address
				session[:user_address_id] = nil
				@user_address = nil
				
				respond_to do |format|
					format.js { render 'error_msg' }
				end	
			else
				address = params[:add]
				address.gsub! /"/, ''

				@user_address = current_location
				@user_address.user = current_user
				@user_address.full_address = address
				@user_address.latitude = params[:lat]
				@user_address.longitude = params[:lng]
				@user_address.distance_from_user = distance

				respond_to do |format|
					if !@user_address.persisted?
						if @user_address.save
							session[:user_address_id] = @user_address.id
							format.js
						end
					else
						if @user_address.update(user: current_user,full_address: @address, latitude: params[:lat], longitude: params[:lng],distance_from_user: @distance)
							session[:user_address_id] = @user_address.id
							format.js
						end
					end
				end	
			end
		end
	end

	def allow_iframe_requests
		response.headers.delete('X-Frame-Options')
	end

end
