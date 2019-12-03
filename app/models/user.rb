class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]
  has_many :flats, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :orders

  validates :first_name, :last_name, presence: true
  mount_uploader :avatar, PhotoUploader
  mount_uploader :id_scan, PhotoUploader
  # after_create :send_welcome_email

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def is_landlord?
    !self.flats.empty?
  end

  def is_tenant?
    !accepted_rentals.empty?
  end

  def pending_invites
    Rental.where(pending: true, tenant_email: self.email)
  end

  def accepted_rentals
    Rental.where(pending: false, tenant_id: self.id)
  end

  def rented_flats
    accepted_rentals.map { |rental| Flat.find(rental.flat_id) }
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first
    unless user
        user = User.create(name: data['name'],
           email: data['email'],
           password: Devise.friendly_token[0,20]
        )
    end
    user
  end


  private

  def send_welcome_email
    UserMailer.with(user: self).welcome.deliver_now
  end
end
