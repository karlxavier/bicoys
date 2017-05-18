class OrderItemsController < ApplicationController
	def create
	    @order = current_order
	    @order.user = current_user
	    @order.restaurant_id = session[:restaurant_id]
	    @order_item = @order.order_items.new(order_item_params)
	    
	    respond_to do |format|
	      if @order.save
	        
	         session[:order_id] = @order.id
	         session[:restaurant_id] = @order.restaurant_id
	      else
	      	puts '*************ERROR*****************'
	      	@order.errors.full_messages.each do |message|
	      		puts message
	      	end
	      end
	      format.js
	    end	
	end

	def update
	    @order = current_order
	    @order_item = @order.order_items.find(params[:id])
	    # @order_items = @order.order_items

	    respond_to do |format|
	      if @order_item.update_attributes(order_item_params)
	        format.html { redirect_to @order_item, notice: 'order was successfully created.' }
	      else
	        format.html { render :new }
	        format.json { render json: @order_item.errors, status: :unprocessable_entity }
	      end
	      format.js
	     end
	end

	def destroy
		puts '*************destroy*****************'
	    @order = current_order
	    @order_item = @order.order_items.find(params[:id])
	    @order_item.destroy
	end

	private
	  def order_item_params
	    params.require(:order_item).permit(:quantity, :menu_id)
	  end

	  def order_params
	    params.require(:order).permit(:user_id)
	  end

end
