class PartiesController < ApplicationController
  def new
  end

  def create
    @party = current_user.parties.create(party_params)
    @party.memberships.where(user_id: current_user).first.update(type: "host")
    redirect_to @party
  end

  def show
    @party = Party.find(params[:id])
    @playlist = RSpotify::Playlist.find(@party.playlist_owner_id, @party.spotify_playlist_id) if @party.spotify_playlist_id
  end

  def import
    @party = Party.find params[:party_id]
    @party.update(spotify_playlist_id: params[:playlist_id], playlist_owner_id: params[:owner_id])
    redirect_to @party
  end

  def new_playlist
    @party = Party.find(params[:party_id])
    @playlist = spotify_user.create_playlist!(@party.name)
    @party.update(spotify_playlist_id: @playlist.id)
    redirect_to @party
  end

  private
  def party_params
    params.required(:party).permit(:name, :threshold)
  end
end
