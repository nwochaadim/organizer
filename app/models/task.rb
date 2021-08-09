class Task < ApplicationRecord
  belongs_to :user
  validates :notes, presence: true
  validates :name, presence: true, uniqueness: { scope: :user_id }

  scope :by_user, ->(user) { where(user: user) }
end
