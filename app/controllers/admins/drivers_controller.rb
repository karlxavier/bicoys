class Admins::DriversController < ApplicationController
	before_action :authenticate_admin!

	def index
		@drivers = Driver.all
	end

	def edit
	end

	def update
	end

	def create
	end

	private

		def driver_params
			params.require(:driver).permit(:name, :driver_license, :aka, :driver_image, :ddriver_status_id)
		end
end
