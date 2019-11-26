class Ticket < ApplicationRecord
  belongs_to :rental
  has_many :subscriptions, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :category, :title, :content, presence: true
  mount_uploader :photo, PhotoUploader
end
