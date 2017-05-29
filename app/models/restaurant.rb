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
	scope :resto_wd_images, -> (resto_id) { includes(:restaurant_images).where(id: resto_id) }
	scope :resto_search, -> (type_id, resto_like) { includes(:menus).references(:menus).where("restaurants.restaurant_type_id = ? AND restaurants.active = ? AND restaurants.name ILIKE ? OR menus.name ILIKE ?", type_id, true, "%#{resto_like}%", "%#{resto_like}%") }
	# scope :resto_search, -> (type_id, resto_like) { where("restaurants.active = ? AND restaurants.name ILIKE ? AND restaurants.restaurant_type_id = ?", true, "%#{resto_like}%", type_id) }

end
