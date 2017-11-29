class Menu < ApplicationRecord
	belongs_to :restaurant
	belongs_to :menu_category
	has_many :menu_add_ons
	has_many :order_items

	before_save :compute_total_price

	validates :name, presence: true
	validates :price, presence: true, numericality: true

	mount_uploader :image, MenuImageUploader

	scope :resto_menus, -> (resto_id) { includes(:menu_category).where( restaurant_id: resto_id, active: true ) }
	scope :all_resto_menus, -> (resto_id) { includes(:menu_category).where( restaurant_id: resto_id ) }

	private

		def compute_total_price
			self[:total_price] = price + (price * (commission / 100))
		end
end
