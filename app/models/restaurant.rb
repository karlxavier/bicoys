class Restaurant < ApplicationRecord
	belongs_to :restaurant_type
	has_many :restaurant_images, inverse_of: :restaurant
	has_many :restos
	has_many :menus
	has_many :menu_categories
	accepts_nested_attributes_for :restaurant_images

	validates :name, :address, presence: true

	mount_uploader :profile_image, ProfileImageUploader
end
