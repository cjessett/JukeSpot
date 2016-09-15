Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, 'app_id', 'app_secret', scope: 'user-read-email
                                                     playlist-read-private
                                                     playlist-modify-public
                                                     playlist-modify-private
                                                     playlist-read-collaborative'
end
