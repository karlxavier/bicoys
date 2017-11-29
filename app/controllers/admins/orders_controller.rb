class Admins::OrdersController < ApplicationController
	before_action :authenticate_admin!

	def current_orders
		@cur_orders = Order.admin_current_orders(2)
	end

	def confirm_order
		respond_to do |format|
			@order = Order.find(params[:order_id])
			@order.update_attributes(order_status_id: 3)

			format.js
		end
	end

	def index
		@orders = Order.all
	end

end
	