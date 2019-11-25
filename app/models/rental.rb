class Rental < ApplicationRecord
  belongs_to :flat
  belongs_to :user
  has_many :tickets
  validates :price, presence: true, numericality: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_after_start

  private

  def end_after_start
    errors.add(:end_date, "must be after the start date") unless end_date > start_date
  end
end
