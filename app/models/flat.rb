class Flat < ApplicationRecord
  belongs_to :user
  has_many :rentals
  has_many :tickets, through: :rentals
  validates :address, presence: true
  validates :capacity, numericality: true
end
