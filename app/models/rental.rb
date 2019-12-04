class Rental < ApplicationRecord
  belongs_to :flat
  has_many :tickets
  validates :price_cents, presence: true, numericality: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :pending, inclusion: [true, false]
  validates :tenant_email, presence: true
  validate :end_after_start
  monetize :price_cents


  def tenant
    User.find(self.tenant_id) unless tenant_id.nil?
  end

  private

  def end_after_start
    errors.add(:end_date, "must be after the start date") unless end_date > start_date
  end
end
