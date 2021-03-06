class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, #:validatable,
         :omniauthable, omniauth_providers: [:vkontakte]
  has_many :posts, inverse_of: :user
  has_many :comments, as: :commentable
  validates :name, presence: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = "#{auth.info.first_name} #{auth.info.last_name}"
      user.password = Devise.friendly_token[0,20]
    end
  end
end
