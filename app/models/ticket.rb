class Ticket < ApplicationRecord
  belongs_to :rental
  has_many :subscriptions, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :category, :title, :content, presence: true
  mount_uploader :photo, PhotoUploader
  accepts_nested_attributes_for :subscriptions, reject_if: proc { |attributes| attributes[:user_id] == "" }
  accepts_nested_attributes_for :subscriptions, allow_destroy: true

  def available_categories
    %w(cleaning event guest incident notice)
  end

  def available_status
    %w(new pending fixed)
  end

  def potential_subscribers
    self.rental.flat.tenants_and_landlord.uniq
  end

  def subscribers
    self.subscriptions.joins(:user).order('users.first_name, users.last_name ASC').map {|sub| sub.user }
  end

end
