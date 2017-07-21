class UserAddressesController < ApplicationController

	def edit
		@user = current_user
		@user_address = @user.user_addresses.last
	end

	def update
		user_address = UserAddress.find(params[:id])
		respond_to do |format|
			if user_address.update_attributes(user_address_params)
				@user = current_user
				@user_address = @user.user_addresses.last
				format.js
			end
		end
	end

	private

		def user_address_params
			params.require(:user_address).permit(:barangay_subdv, :landline_number, :street_name, :additional_directions)
		end

end
