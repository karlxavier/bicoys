class OrderItem < ApplicationRecord
	belongs_to :menu
	belongs_to :order

	before_save :finalize

	# scope :user_orders, -> (id, resto_id) { includes(:menus).where(restaurant_id: resto_id, id: id) }

	def unit_price
	    if persisted?
	    	self[:unit_price]
		else
		    menu.price      
		end    
	end

	def total_price
	    unit_price * quantity
	end

private
	def menu_present
	    if menu.nil?
	    	errors.add(:menu, "is not valid or is not active.")
	    end
	end

	def order_present
	    if order.nil?
	    	errors.add(:order, "is not a valid order.")
	    end
	end

	def finalize
	    self[:unit_price] = unit_price
	    self[:total_price] = quantity * self[:unit_price]
	end
end
