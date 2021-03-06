class Flat < ApplicationRecord
  belongs_to :user
  has_many :rentals, dependent: :destroy
  has_many :tickets, through: :rentals
  validates :address, presence: true
  validates :capacity, numericality: true
  mount_uploader :photo, PhotoUploader

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def pending_rentals
    self.rentals.where(pending: true)
  end

  def accepted_rentals
    self.rentals.where(pending: false).sort_by {|rental| rental.tenant.first_name}
  end

  def tenants
    accepted_rentals.map{|rental| User.find(rental.tenant_id)}.uniq
  end

  def tenants_and_landlord
    tenants + [self.user]
  end

  def tenants_names
    accepted_rentals.map{|rental| User.find(rental.tenant_id).full_name}
  end

end

