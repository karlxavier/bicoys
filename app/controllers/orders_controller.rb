class OrdersController < ApplicationController
	before_action :authenticate_user!, only: [:checkout]
	before_action :check_user_verification, only: [:checkout]

	def checkout
		respond_to do |format|
			@order = Order.find(current_order.id)
			@user = current_user
			if @user
				@order.user = @user
				if @user.verified?
					@order.wizard = 2
					format.js { render partial: 'wizard/wizard_delivery' }
				else
					@order.wizard = 1
					# format.html
				end
				@order.save
			end
			format.html
		end
	end

	def edit_address
		@user_address = current_location

		respond_to do |format|
			format.js
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
			permit.require(:user_addresses).require(:barangay_subdv, :landline_number, :street_name, :additional_directions)
		end

		def check_user_verification
			if !current_user.verified?
				puts '******** NOT VERIFIED ***********'
				redirect_to user_verify_mobile_path
			end
		end

end
