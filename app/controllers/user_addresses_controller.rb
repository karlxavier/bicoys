class UserAddressesController < ApplicationController

	def update
		user_address = UserAddress.find(params[:id])
		respond_to do |format|
			if user_address.update_attributes(user_address_params)
				format.js
			end
		end
	end

	private

		def user_address_params
			params.require(:user_address).permit(:mobile_number, :landline_number, :street_name, :additional_directions)
		end

end
