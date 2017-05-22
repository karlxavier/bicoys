class TariffRate < ApplicationRecord

	validates :min_km, :max_km, :min_order, presence: true

	scope :resto_rate, -> (user_km){ where('min_km <= ? AND max_km >= ?', user_km, user_km) }

end
