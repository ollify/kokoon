class Rental < ApplicationRecord
  belongs_to :flat
  belongs_to :user
  has_many :tickets
end
