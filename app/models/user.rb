class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  has_many :groups, foreign_key: 'author_id'
  has_many :entities, foreign_key: 'author_id'
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable,:confirmable,:recoverable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2, :github],
         authentication_keys: [:login], confirmation_keys: [:login]

  # validates :name, presence: true

  def is?(role)
    self.role == role.to_s
  end

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do | user |
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = provider_data.info.name   # assuming the user model has a name
      user.skip_confirmation!
    end
  end
end