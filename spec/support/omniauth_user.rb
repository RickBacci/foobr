module OmniAuthUser
  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(
      {
        "provider" => "google_oauth2",
        "uid"      => "108697336751226714658",
        "info" =>
          {
            "name"  => "Rick Bacci",
            "email" => "brownieelf175@gmail.com",
          },
       "credentials"=>
         {
           "token"      => ENV["google_token"],
           "expires_at" => 1438814378
         },
      })
  end

  def stub_user
    User.create!(
      {
        "provider"         => "google_oauth2",
        "uid"              => "108697336751226714658",
        "name"             => "Rick Bacci",
        "email"            => "brownieelf175@gmail.com",
        "oauth_token"      => ENV["google_token"],
        "oauth_expires_at" => 1439428255
      })
  end
end
