class Menu < ApplicationRecord
	belongs_to :restaurant
	belongs_to :menu_category
	has_many :menu_add_ons

	before_save :compute_total_price

	validates :name, presence: true
	validates :price, presence: true, numericality: true

	mount_uploader :image, MenuImageUploader

	private

		def compute_total_price
			self[:total_price] = price + (price * (commission / 100))
		end
end
