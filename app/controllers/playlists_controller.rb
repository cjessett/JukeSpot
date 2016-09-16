class PlaylistsController < ApplicationController
  def import
    puts params
    @party = Party.find params[:party_id]
    @party.spotify_playlist_id = params[:id] unless @party.spotify_playlist_id
    @party.save
    redirect_to @party
  end
end
