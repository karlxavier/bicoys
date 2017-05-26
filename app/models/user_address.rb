class UserAddress < ApplicationRecord
	belongs_to :user

	validates :full_address, :latitude, :longitude, :mobile_number, :street_name, presence: true
end
