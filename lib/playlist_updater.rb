module PlaylistUpdater

  TOKEN_URI = 'https://accounts.spotify.com/api/token'

  def header(party)
    {
      'Authorization' => "Bearer #{party.host.token}",
      'Content-Type' => 'application/json'
    }
  end

  def replace_tracks(tracks, party)
    track_uris = tracks.map(&:uri).join(',')
    owner_id = party.playlist_owner_id
    playlist_id = party.spotify_playlist_id

    path = "https://api.spotify.com/v1/users/#{owner_id}/playlists/#{playlist_id}"
    url = "#{path}/tracks?uris=#{track_uris}"
    header = self.header(party)

    send_it(party, url, header)
  end

  def refresh(party)
    request_body = {
      grant_type: 'refresh_token',
      refresh_token: party.host.refresh_token
    }
    response = RestClient.post(TOKEN_URI, request_body, RSpotify.send(:auth_header))
    response = JSON.parse(response)
    party.host.update(token: response['access_token'])
  end

  def send_it(party, path, *params)
    begin
      self.send(:send_request, "put", path, *params)
    rescue
      self.refresh(party)
      params[-1] = self.header(party)
      self.send(:send_request, "put", path, *params)
    end
  end

  def send_request(verb, path, *params)
    url = path

    url, query = *url.split('?')
    url = URI::encode(url)
    url << "?#{query}" if query

    begin
      response = RestClient.send(verb, url, {}, *params)
    rescue RestClient::Unauthorized
      if @client_token
        authenticate(@client_id, @client_secret)
        response = RestClient.send(verb, url, {}, *params)
      end
    end

    JSON.parse response unless response.empty?
  end

  def auth_header
    authorization = Base64.strict_encode64 "#{@client_id}:#{@client_secret}"
    { 'Authorization' => "Basic #{authorization}" }
  end

  def authenticate(client_id, client_secret)
    @client_id, @client_secret = client_id, client_secret
    request_body = { grant_type: 'client_credentials' }
    response = RestClient.post(TOKEN_URI, request_body, auth_header)
    @client_token = JSON.parse(response)['access_token']
    true
  end
end




