class Admins::RestaurantsController < ApplicationController
	before_action :authenticate_admin!
end
