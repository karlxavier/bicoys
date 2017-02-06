class Restaurant < ApplicationRecord
	mount_uploaders :images, ImageUploader
	belongs_to :restaurant_type

	validates :name, :address, presence: true
end
