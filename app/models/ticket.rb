class Ticket < ApplicationRecord
  belongs_to :rental
  has_many :subscriptions
  has_many :comments
end
