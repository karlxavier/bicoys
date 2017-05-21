class OrdersController < ApplicationController
	before_action :authenticate_user!, only: [:checkout]

	def checkout
		@order = Order.find(current_order.id)
	end

end
