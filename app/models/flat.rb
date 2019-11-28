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
    self.rentals.where(pending: false)
  end

  def tenants
    accepted_rentals.map{|rental| User.find(rental.tenant_id)}
  end

  def tenants_names
    accepted_rentals.map{|rental| User.find(rental.tenant_id).full_name}
  end

  def rental(user)
    self.rentals.reverse.find {|rental| rental.tenant_id == user.id}
  end

end

