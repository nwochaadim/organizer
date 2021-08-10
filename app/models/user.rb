class User < ApplicationRecord
  include Clearance::User

  validates :name, presence: true

  has_many :tasks, dependent: :destroy
end
