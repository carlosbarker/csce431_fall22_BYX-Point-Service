class Meeting < ApplicationRecord
    validates :service_point_id, presence: true
    validates :student_id, presence: true
    validates :event_id, presence: true
    validates :time, presence: true

    has_many :attendance
end
