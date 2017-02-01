class Order < ApplicationRecord
	belongs_to :order_status
	belongs_to :payment_type
	belongs_to :restaurant

	validates :subtotal, :total, presence: true
end
