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

  def potential_subscribers
    self.rental.flat.tenants_and_landlord.uniq - [current_user]
  end

  def subscribers
    self.subscriptions.map {|sub| sub.user }
  end

end
