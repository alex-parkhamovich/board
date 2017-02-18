class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :twitter, :vkontakte]

  has_many :posts
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "original/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates :name, presence: true
  validates_length_of :name, :minimum => 5, :maximum => 25

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      if ['twitter', 'vkontakte'].any? {|pr| auth.provider.include? pr}
        user.email = auth.uid + '@advertsboard.com'
      else
        user.email = auth.info.email
      end
      user.name = auth.info.name
      user.password = Devise.friendly_token[0,20]
      user.avatar = auth.info.image
    end
  end
end