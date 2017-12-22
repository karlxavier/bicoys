class Order < ApplicationRecord
	ratyrate_rateable 'food_rate', 'delivery_rate'

	belongs_to :order_status
	belongs_to :payment_type
	belongs_to :restaurant
	belongs_to :user
	has_many :order_items
	has_many :menus, through: :order_items

	has_many :identities, through: :user

	before_create :set_order_status
	before_create :set_order_service_charge
	before_save :update_subtotal
  	before_save :update_total

	validates :subtotal, :total, presence: true

	scope :user_current_orders, -> (id, resto_id) { includes(:menus).where(restaurant_id: resto_id, id: id, order_status_id: 1) }
	scope :user_finish_orders, -> (user_id) { includes(:restaurant, :order_status, :order_items).where(user_id: user_id).where("order_status_id != 1").order(created_at: :desc) }
	scope :admin_current_orders, -> (status_id) { includes(:restaurant, order_items: :menu, user: [:user_addresses, :identities] ).where(order_status_id: status_id).order(created_at: :desc) }
	scope :resto_current_orders, -> (status_id, restaurant_id) { includes(:restaurant, order_items: :menu, user: [:user_addresses, :identities] ).where(order_status_id: status_id, restaurant_id: restaurant_id).order(created_at: :desc) }
	scope :last_order, -> { includes(:user, :identities).last }

	def subtotal    
	    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
	end

	def total
    	subtotal + AdminRate.first.service_charge
  	end

	private
	  def set_order_status
	    self.order_status_id = 1
	  end

	  def set_order_service_charge
	  	self.delivery_charge = AdminRate.first.service_charge
	  end

	  def update_subtotal
	    self[:subtotal] = subtotal    
	  end

	  def update_total
	    self[:total] = total
	  end

end
