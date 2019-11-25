class Flat < ApplicationRecord
  belongs_to :user
  has_many :rentals
  has_many :tickets, through: :rentals
  validates :address, presence: true
  validates :capacity, numericality: true
  mount_uploader :photo, PhotoUploader

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

end

