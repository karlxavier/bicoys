class SuggestRestosController < ApplicationController
	before_action :authenticate_user!

	def new
		@suggest_resto = SuggestResto.new
	end

	def create
		@suggest_resto = SuggestResto.new(suggest_params)
		@suggest_resto.user_id = current_user.id

		# respond_to do |format|
			if @suggest_resto.save
				# format.js render 'show_message'
				redirect_to root_path
			else
				render 'new'
			end
		# end

	end

	private

		def suggest_params
			params.require(:suggest_resto).permit(:name, :address, :phone, :latitude, :longitude, :restaurant_type_id)
		end

end
