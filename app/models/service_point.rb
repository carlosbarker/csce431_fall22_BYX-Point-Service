class ServicePoint < ApplicationRecord
    validates :service_point_id, :student_id, :event_id, :time, presence: true
    
    belongs_to :member
end
