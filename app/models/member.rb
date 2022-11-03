class Member < ApplicationRecord
  devise :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :service_points, dependent: :destroy
  has_one :events, through: :service_points

  def self.from_omniauth(auth)
    Person.where(email: auth.info.email).first
  end
end
