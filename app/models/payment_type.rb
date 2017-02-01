class PaymentType < ApplicationRecord
	has_many :orders

	validates :PType, presence: true
end
