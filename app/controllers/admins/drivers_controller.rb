class Admins::DriversController < ApplicationController
	before_action :authenticate_admin!

	def index
		@drivers = Driver.all
	end

	def new
		@driver = Driver.new
	end

	def edit
	end

	def update
	end

	def create
	end

	private

		def driver_params
			params.require(:driver).permit(:name, :driver_license, :aka, :driver_image, :driver_status_id)
		end
end
