class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]
  has_many :flats, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :first_name, :last_name, presence: true
  mount_uploader :avatar, PhotoUploader
  mount_uploader :id_scan, PhotoUploader

  def full_name
    return "#{self.first_name} #{self.last_name}"
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
end
