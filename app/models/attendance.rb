class Attendance < ApplicationRecord
    validates :attendance_id, presence: true
    validates :student_id, presence: true
    validates :meeting_id, presence: true
    validates :tardy, presence: true

    belongs_to :member
    has_one :meeting
end
