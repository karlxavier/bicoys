class MenuCategory < ApplicationRecord
	belongs_to :restaurant
	has_many :menus

	validates :name, :restaurant, presence: true

	scope :menu_cats, -> (resto_id) { includes(:menus).select('menu_categories.id','menu_categories.name').where(restaurant_id: resto_id, menus: { active: true }, id: Menu.having('count(1) > 0', count).group(:menu_category_id).select(:menu_category_id)) }

end
