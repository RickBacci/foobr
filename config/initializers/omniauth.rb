Rails.application.config.middleware.use OmniAuth::Builder do

  provider :google_oauth2,
    ENV['GOOGLE_CLIENT_ID'],
    ENV['GOOGLE_CLIENT_SECRET'], {
      access_type: 'offline',
      scope: 'profile, email, calendar'
    }
end
