class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :flats
  has_many :subscriptions
  has_many :comments

  validates :first_name, :last_name, presence: true
  mount_uploader :avatar, PhotoUploader
  mount_uploader :id_scan, PhotoUploader

  def full_name
    return "#{self.first_name} #{self.last_name}"
  end
end
