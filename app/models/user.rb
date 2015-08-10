class User < ActiveRecord::Base
  require 'rubygems'
  require 'google/apis/calendar_v3'

  has_many :specialties
  has_many :projects

  validates :provider, presence: true
  validates :uid, presence: true
  validates :name, presence: true
  validates :email, presence: true
  validates :oauth_token, presence: true

  def self.from_omniauth(auth, role='client')
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider         = auth.provider
      user.uid              = auth.uid
      user.name             = auth.info.name
      user.email            = auth.info.email
      user.first_name       = auth.info.first_name
      user.last_name        = auth.info.last_name
      user.image            = auth.info.image
      user.oauth_token      = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.role             = role
      user.save!
    end
  end

  def specialty_names
    specialties.map(&:specialty_name)
  end

  def calendar_client
    calendar = Google::Apis::CalendarV3::CalendarService.new
    calendar.request_options.authorization = oauth_token
    calendar
  end

end

