class Order < ApplicationRecord
	belongs_to :order_status
	belongs_to :payment_type
	belongs_to :restaurant
	belongs_to :user
	has_many :order_items

	before_create :set_order_status
	before_save :update_subtotal
  	before_save :update_total

	validates :subtotal, :total, presence: true

	def subtotal    
	    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
	end

	def total
    	subtotal + 50 # 50 is the service charge
  	end

	private
	  def set_order_status
	    self.order_status_id = 1
	  end

	  def update_subtotal
	    self[:subtotal] = subtotal    
	  end

	  def update_total
	    self[:total] = total  
	  end

end
