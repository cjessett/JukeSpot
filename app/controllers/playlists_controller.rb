class PlaylistsController < ApplicationController
  def import
    puts params
    @party = Party.find params[:party_id]
    @party.spotify_playlist_id = params[:id]
    @party.save
    redirect_to @party
  end

  def new
    @party = Party.find(:party_id)
    @playlist = spotify_user.create_playlist!(@party.name)
    @party.spotify_playlist_id = @playlist.id
    redirect_to @party
  end
end
