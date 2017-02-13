class RestaurantImage < ApplicationRecord

	belongs_to :restaurant
	
	validates :restaurant, presence: true
	validates :image, presence: true

	mount_uploader :image, ImageUploader
end
