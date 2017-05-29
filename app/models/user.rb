class User < ApplicationRecord
	has_many :orders
	has_many :user_addresses
	has_many :suggest_restos
	
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
