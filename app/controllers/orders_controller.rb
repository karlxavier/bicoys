class OrdersController < ApplicationController
	before_action :authenticate_user!, only: [:checkout]

	def checkout
		respond_to do |format|
			@order = Order.find(current_order.id)
			@user = current_user
			if @user
				@order.user = @user
				@order.save
			end
			
			@user_address = current_location

			format.html
		end
	end

	def update_user_address
		user_address = current_location
		respond_to do |format|
			if user_address.update_attributes(user_address_params)
				format.js
			end
		end
	end

	private

		def user_address_params
			permit.require(:user_addresses).require(:mobile_number, :landline_number, :street_name, :additional_directions)
		end

end
