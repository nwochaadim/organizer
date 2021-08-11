class User < ApplicationRecord
  include Clearance::User

  validates :name, presence: true

  has_many :task_memberships
  has_many :tasks, through: :task_memberships
end
