class Event < ApplicationRecord
    validates :datetime, presence: true

    has_many :service_point
end
