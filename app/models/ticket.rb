class Ticket < ApplicationRecord
  belongs_to :rental
  has_many :subscriptions, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :category, :title, :content, presence: true
  mount_uploader :photo, PhotoUploader

  def available_categories
    %w(incident event guest)
  end

  def available_statuses
    %w(new pending fixed)
  end

end
