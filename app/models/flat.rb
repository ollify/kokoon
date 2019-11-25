class Flat < ApplicationRecord
  belongs_to :user
  has_many :rentals
  has_many :tickets, through: :rentals
end
