class Member < ApplicationRecord
  devise :omniauthable, omniauth_providers: [:google_oauth2]

  validates :member_id, presence: true
  validates :name, presence: true
  validates :graduated, presence: true
  validates :admin, presence: true
  validates :card_id, presence: true
  validates :email, presence: true
  validates :phone, presence: true

  has_many :service_point, dependent: :destroy
  has_many :attendance, dependent: :destroy

  def self.from_omniauth(auth)
    Person.where(email: auth.info.email).first
  end
end
