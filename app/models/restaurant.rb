class Restaurant < ApplicationRecord
	mount_uploaders :images, ImageUploader
	mount_uploaders :profile_image, ProfileImageUploader
	belongs_to :restaurant_type

	validates :name, :address, presence: true
end
