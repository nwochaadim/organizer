class Task < ApplicationRecord
  belongs_to :user
  validates :notes, presence: true
  validates :name, presence: true, uniqueness: { scope: :user_id }
end
