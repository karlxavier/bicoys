class RestaurantTypesController < ApplicationController

	def index
		@resto_recent = Restaurant.most_recent(4,1)
		@bake_recent = Restaurant.most_recent(4,2)

		@user_address = UserAddress.where(id: session[:user_address_id]).first

		if @user_address
			distance = Geocoder::Calculations.distance_between([7.065547,125.608295], [@user_address.latitude,@user_address.longitude]).round(1)
			respond_to do |format|
				format.html
			end
		end
	end

	def show
		@resto_type = RestaurantType.find(params[:id])
	end

	def user_location
		if !params[:lat].nil? && !params[:lng].nil?
			distance = Geocoder::Calculations.distance_between([7.065547,125.608295], [params[:lat],params[:lng]]).round(1) * 1.609
			distance = distance.round(1) 
			if distance > 15
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

				respond_to do |format|
					if !@user_address.persisted?
						if @user_address.save
							session[:user_address_id] = @user_address.id
							format.js
						end
					else
						if @user_address.update(user: current_user,full_address: address, latitude: params[:lat], longitude: params[:lng])
							session[:user_address_id] = @user_address.id
							format.js
						end
					end
				end	
			end
		end
	end

end
