class ServicePoint < ApplicationRecord
    belongs_to :member
    has_one :event
end
