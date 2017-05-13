class MenuCategory < ApplicationRecord
	belongs_to :restaurant
	has_many :menus

	validates :name, :restaurant, presence: true

	scope :menu_cats, -> (resto_id) { select('menu_categories.id','menu_categories.name').distinct.joins(:menus).where(restaurant_id: resto_id) }

end
