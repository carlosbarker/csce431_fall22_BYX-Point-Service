class Attendance < ApplicationRecord
    validates :tardy, presence: true

    belongs_to :member
    has_one :meeting
end
