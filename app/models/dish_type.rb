class DishType < ApplicationRecord
	has_many :menus

	validates :DType, presence: true
end
