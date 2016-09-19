class Party < ApplicationRecord
  has_many :memberships
  has_many :users, :through => :memberships
  has_many :juke_tracks
  after_touch :update_playlist

  def update_playlist
    self.playlist.replace_tracks!(self.build_spotify_tracks)
  end

  def host
    memberships.where(host: true).first.user
  end

  def playlist
    RSpotify::Playlist.find(playlist_owner_id, spotify_playlist_id) if spotify_playlist_id && playlist_owner_id
  end

  def active_tracks
    juke_tracks.where(active: true)
  end

  def staged_tracks
    juke_tracks.where(active: false)
  end

  def build_spotify_tracks
    self.active_tracks.map do |juke_track|
      RSpotify::Track.find(juke_track.track.spotify_id)
    end
  end

end
