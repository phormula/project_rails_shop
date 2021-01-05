class User < ApplicationRecord
  has_one :cart
  has_many :orders
  has_many :addresses, through: :orders
  has_many :comments

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         devise :omniauthable, :omniauth_providers => [:facebook]

  def self.from_omniauth(auth_hash)
    self.where(provider: auth_hash.provider, uid: auth_hash.uid).first_or_create do |user|
      user.email = auth_hash.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

end
