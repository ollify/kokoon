class Ticket < ApplicationRecord
  belongs_to :rental
  has_many :subscriptions, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :category, :title, :content, presence: true
  mount_uploader :photo, PhotoUploader
  accepts_nested_attributes_for :subscriptions, reject_if: proc { |attributes| attributes[:user_id] == "" }

  def available_categories
    %w(incident event guest)
  end

  def available_status
    %w(new pending fixed)
  end

end
