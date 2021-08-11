class Comment < ApplicationRecord
  belongs_to :task
  belongs_to :user

  validates :body, presence: true

  delegate :name, to: :user, prefix: true
end
