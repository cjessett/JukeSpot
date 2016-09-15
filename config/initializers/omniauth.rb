Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, ENV['CLIENT_ID'], ENV['CLIENT_SECRET'], scope: 'user-read-email
                                                                     playlist-read-private
                                                                     playlist-modify-public
                                                                     playlist-modify-private
                                                                     playlist-read-collaborative'
end
