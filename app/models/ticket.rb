class Ticket < ApplicationRecord
  belongs_to :rental
  has_many :subscriptions
  has_many :comments
  validates :category, :title, :content, presence: true
  mount_uploader :photo, PhotoUploader
end
