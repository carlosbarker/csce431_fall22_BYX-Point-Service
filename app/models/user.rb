class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable,
    :omniauthable, omniauth_providers: [:google_oauth2]

    def self.from_omniauth(auth)
        #Member.where(email: auth.info.email).first

        where(provider: auth.provider, uid: auth.uid).first_or_create do |member|
        member.email = auth.info.email
        member.password = Devise.friendly_token[0, 20]
        member.full_name = auth.info.name
        member.avatar_url = auth.info.image
        end
    end

    belongs_to :members, foreign_key: 'email', primary_key: 'email', optional: true
end
