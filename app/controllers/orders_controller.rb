class OrdersController < ApplicationController
	before_action :authenticate_user!, only: [:checkout]

	def checkout
		@order = Order.find(current_order.id)
		@user_address = current_location
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
