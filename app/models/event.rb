class Event < ApplicationRecord
    validates :event_id, presence: true
    validates :start_time, presence: true
    validates :date, presence: true
    validates :description, presence: true

    has_many :service_point
end
