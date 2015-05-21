class User < ActiveRecord::Base
  acts_as_votable
  acts_as_messageable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :carpools, :dependent => :destroy
  has_many :cars, :dependent => :destroy
  has_many :users
  has_many :locations
  has_many :testimonials, :dependent => :destroy
  has_attached_file :picture, styles: { medium: "250x250>", thumb: "50x50>"},default_url: "blank.png"
    validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/

    validates :username, :presence => :true
    validates :phone_number, length: { maximum: 10 }

    def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.username = auth.info.name
      user.email = auth.info.email
      user.password = "12345678"
      
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
