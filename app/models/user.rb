class User < ApplicationRecord
  ratyrate_rater
  
  has_many :identities
	has_many :orders
	has_many :user_addresses
	has_many :suggest_restos 

  validates :email, presence: true, format: { with: /\A.+@.+$\Z/ }, uniqueness: true
  validates :fullname, presence: true
	
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :omniauthable#, :validatable, :omniauth_providers => [:facebook]

  def twitter
    identities.where( :provider => "twitter" ).first
  end

  def twitter_client
    @twitter_client ||= Twitter.client( access_token: twitter.accesstoken )
  end

  def facebook
    identities.where( :provider => "facebook" ).first
  end

  def facebook_client
    @facebook_client ||= Facebook.client( access_token: facebook.accesstoken )
  end

  def instagram
    identities.where( :provider => "instagram" ).first
  end

  def instagram_client
    @instagram_client ||= Instagram.client( access_token: instagram.accesstoken )
  end

  def landline_number
    [international_code, mobile_no].join('   ')
  end

  def international_code
    self.country_code = ISO3166::Country[country_code]
    country_code.international_prefix
  end

end
