class Restaurant < ApplicationRecord
	belongs_to :restaurant_type
	has_many :restaurant_images, inverse_of: :restaurant
	has_many :restos
	has_many :menus
	has_many :menu_categories
	accepts_nested_attributes_for :restaurant_images

	validates :name, :address, presence: true

	mount_uploader :profile_image, ProfileImageUploader

	scope :most_recent, -> (limited, resto_type) { where( restaurant_type_id: resto_type ).order( created_at: :desc).limit(limited) }
	# scope :restos, -> (type_id) { includes(:restaurant_type).where( restaurant_type_id: type_id, active: true) }
	# scope :resto_menus, -> (resto_id) { select('restaurants.id','menus.name','restaurants.latitude').joins(:menus).where( active: :true, id: resto_id) }

end
