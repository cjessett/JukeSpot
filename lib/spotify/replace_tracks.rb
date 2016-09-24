module Playlist
  def replace_tracks(tracks, party)
    track_uris = tracks.map(&:uri).join(',')

    user_id = party.playlist_owner_id
    playlist_id = party.spotify_playlist_id

    path = "https://api.spotify.com/v1/users/#{user_id}/playlists/#{playlist_id}"
    url = "#{path}/tracks?uris=#{track_uris}"
  end
end
