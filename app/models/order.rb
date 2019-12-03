class Order < ApplicationRecord
  belongs_to :rental
  belongs_to :user
  monetize :amount_cents
end
