class UserAddress < ApplicationRecord
	belongs_to :user

	validates :full_address, :latitude, :longitude, presence: true
end
