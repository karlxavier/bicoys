class Admins::DashboardController < ApplicationController
	before_action :authenticate_admin!

end
