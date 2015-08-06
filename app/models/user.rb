class User < ActiveRecord::Base
  has_many :specialties

  validates :provider, presence: true
  validates :uid, presence: true
  validates :name, presence: true
  validates :email, presence: true
  validates :oauth_token, presence: true
# validates :oauth_expires_at, presence: true


  def self.from_omniauth(auth, role)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider         = auth.provider
      user.uid              = auth.uid
      user.name             = auth.info.name
      user.email            = auth.info.email
      user.first_name       = auth.first_name
      user.last_name        = auth.last_name
      user.image            = auth.image
      user.oauth_token      = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.role             = role
      user.save!
    end
  end
end

