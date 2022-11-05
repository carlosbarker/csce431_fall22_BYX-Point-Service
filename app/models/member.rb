class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  # validates :member_id, presence: true
  # validates :name, presence: true
  # validates :graduated, presence: true
  # validates :admin, presence: true
  # validates :card_id, presence: true
  # validates :email, presence: true
  # validates :phone, presence: true

  # has_many :service_point, dependent: :destroy
  # has_many :attendance, dependent: :destroy

  def self.from_omniauth(auth)
    #Member.where(email: auth.info.email).first
    where(provider: auth.provider, uid: auth.uid).first_or_create do |member|
      member.email = auth.info.email
      member.password = Devise.friendly_token[0, 20]
      member.full_name = auth.info.name
      member.avatar_url = auth.info.image
    end
  end
end
