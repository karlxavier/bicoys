class OrdersController < ApplicationController
	before_action :authenticate_user!, only: [:checkout]
	before_action :check_user_verification, only: [:checkout]

	def checkout
		respond_to do |format|
			@order = Order.find(current_order.id)
			@user = current_user
			@user_address = @user.user_addresses.last

			format.html
		end
	end

	# def edit_address
	# 	@user_address = current_location

	# 	respond_to do |format|
	# 		format.js
	# 	end
	# end

	# def update_user_address
	# 	user_address = current_location
	# 	respond_to do |format|
	# 		if user_address.update_attributes(user_address_params)
	# 			@user = current_user
	# 			@user_address = @user.user_addresses.last
	# 			format.js
	# 		end
	# 	end
	# end

	def update
		order = Order.find(current_order)
		order.user_id = current_user.id
		order.order_status_id = 2 # CHECKOUT CONFIRM STATUS
		if order.update_attributes(order_params)
			# redirect_to root_path
		end
	end

	private

		def order_params
			params.require(:order).permit(:delivery_notes)
		end

		# def user_address_params
		# 	params.require(:user_addresses).permit(:barangay_subdv, :landline_number, :street_name, :additional_directions)
		# end

		def check_user_verification
			if !current_user.verified?
				puts '******** NOT VERIFIED ***********'
				redirect_to user_verify_mobile_path
			end
		end

end
