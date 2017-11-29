class Admins::RestosController < ApplicationController
	before_action :authenticate_admin!

	def index
		@restos = Resto.all
	end


end
	