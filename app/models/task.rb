class Task < ApplicationRecord
  validates :notes, presence: true
  validates :name, presence: true

  has_many :task_memberships
  has_many :users, through: :task_memberships
  has_many :comments

  scope :not_deleted, -> { where(deleted_at: nil) }

  def soft_delete
    update(deleted_at: Time.now)
  end
end
