class Party < ApplicationRecord
  has_many :juke_tracks
  has_many :memberships
  has_many :users, through: :memberships

  validate :default_threshold

  after_touch :update_playlist

  def host
    memberships.where(host: true).first.user
  end

  def playlist
    if spotify_playlist_id && playlist_owner_id
      RSpotify::Playlist.find(playlist_owner_id, spotify_playlist_id)
    end
  end

  def update_playlist
    self.playlist.replace_tracks!(self.grab_active_tracks) unless self.playlist.total > 100
  end

  def grab_active_tracks
    self.juke_tracks.active.map do |juke_track|
      juke_track.track
    end
  end

  def default_threshold
    self.threshold = self.threshold.nil? ? 0 : self.threshold
  end

  def generate_invite_link
    begin
      self.invite_link = SecureRandom.hex(6)
    end while self.class.exists?(invite_link: self.invite_link)
  end
end
