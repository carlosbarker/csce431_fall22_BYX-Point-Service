class Meeting < ApplicationRecord
    validates :datetime, presence: true
    
    has_many :attendance
end
