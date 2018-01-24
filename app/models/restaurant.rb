class Restaurant < ApplicationRecord
	extend FriendlyId
  	friendly_id :name, use: [:slugged, :finders]#, slug_column: :name

  	ratyrate_rateable 'resto_rate'

	belongs_to :restaurant_type
	has_many :restaurant_images, inverse_of: :restaurant
	has_many :restos
	has_many :menus
	has_many :menu_categories
	has_many :orders
	has_many :restaurant_timings
	accepts_nested_attributes_for :restaurant_images
	accepts_nested_attributes_for :restaurant_timings

	validates :name, :address, presence: true

	mount_uploader :profile_image, ProfileImageUploader

	scope :most_recent, -> (limited, resto_type) { where( restaurant_type_id: resto_type ).order( created_at: :desc).limit(limited) }
	scope :resto_wd_images, -> (resto_id) { includes(:restaurant_images).where(slug: resto_id) }
	scope :resto_search, -> (type_id, resto_like) { includes(:menus).references(:menus).where("restaurants.restaurant_type_id = ? AND restaurants.active = ? AND restaurants.name ILIKE ? OR menus.name ILIKE ?", type_id, true, "%#{resto_like}%", "%#{resto_like}%") }


end
