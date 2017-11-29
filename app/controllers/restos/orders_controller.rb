class Restos::OrdersController < ApplicationController
	before_action :authenticate_resto!

	def current_orders
		@cur_orders = Order.resto_current_orders(3, current_resto.restaurant_id)
	end

	def order_ready
		order = Order.find(params[:order_id])
		order.update_attributes(order_status_id: 5) # ON THE WAY STATUS

		redirect_to :back
	end
end
