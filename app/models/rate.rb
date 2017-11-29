class Rate < ActiveRecord::Base
  belongs_to :rater, :class_name => "User"
  belongs_to :rateable, :polymorphic => true

  scope :resto_stars, -> (resto_id) { Rate.where( rateable_type: 'Restaurant', rateable_id: resto_id ).average(:stars) || 0 }

end