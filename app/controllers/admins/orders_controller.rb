class Admins::OrdersController < ApplicationController
	before_action :authenticate_admin!

	def current_orders
		@cur_orders = Order.admin_current_orders(3)
	end

	def index
		@orders = Order.all
	end

end
