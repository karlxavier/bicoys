class Restos::RestaurantsController < ApplicationController
	before_action :authenticate_resto!
end
