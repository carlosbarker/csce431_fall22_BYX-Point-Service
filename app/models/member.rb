class Member < ApplicationRecord
  validates :full_name, presence: true

  has_one :user
end
