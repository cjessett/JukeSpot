class PartiesController < ApplicationController
  before_action :require_member, except: [:new, :create]

  def new
  end

  def create
    @party = current_user.parties.create(party_params)
    @party.memberships.where(user_id: current_user).first.update(host: true)
    playlist = spotify_user.create_playlist!(@party.name)
    @party.update(spotify_playlist_id: playlist.id, playlist_owner_id: spotify_user.id)
    redirect_to @party, notice: "'#{@party.name}' playlist created!"
  end

  def show
    @party = Party.includes(:juke_tracks).find(params[:id])
    @playlist = @party.playlist
  end

  def import
    @party = Party.find params[:id]
    playlist = RSpotify::Playlist.find(params[:owner_id], params[:playlist_id])
    import_list playlist
    redirect_to @party, notice: "imported #{playlist.name} from Spotify!"
  end

  private
  def party_params
    params.required(:party).permit(:name, :threshold)
  end

  def import_list(playlist)
    playlist.tracks.each do |track|
      add_to_party(import_track(track))
    end
  end

  def import_track(track)
    Track.find_or_create_by(spotify_id: track.id, name: track.name, uri: track.uri)
  end

  def add_to_party(imported_track)
    @party
    .juke_tracks
    .find_or_create_by(track_id: imported_track.id, active: true, import: true)
  end

  def require_member
    unless Party.find(params[:id]).users.include? current_user
      redirect_to root_path
    end
  end
end
