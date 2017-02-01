class OrderStatus < ApplicationRecord
	has_many :OrderStatus

	validates :OStatus, :presence true
end
