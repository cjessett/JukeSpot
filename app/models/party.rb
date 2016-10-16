require 'playlist_updater'

class Party < ApplicationRecord
  include PlaylistUpdater

  has_many :juke_tracks
  has_many :memberships
  has_many :users, through: :memberships

  validate :default_threshold
  validates_uniqueness_of :invite_link
  validates_presence_of :invite_link

  after_touch :update_playlist
  before_create :generate_invite_link

  def host
    memberships.where(host: true).first.user
  end

  def playlist
    if spotify_playlist_id && playlist_owner_id
      RSpotify::Playlist.find(playlist_owner_id, spotify_playlist_id)
    end
  end

  def update_playlist
    replace_tracks(self.grab_active_tracks, self) unless self.playlist.total > 100
  end

  def grab_active_tracks
    self.juke_tracks.active.map{ |juke_track| juke_track.track }
  end

  def default_threshold
    self.threshold = self.threshold.nil? ? 0 : self.threshold
  end

  def generate_invite_link
    while !self.valid?
      self.invite_link = SecureRandom.hex 6
      self.save
    end
  end
end
