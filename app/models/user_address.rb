class UserAddress < ApplicationRecord
	belongs_to :user

	validates :full_address, :latitude, :longitude, :additional_directions, presence: true
end
