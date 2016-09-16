class PartiesController < ApplicationController
  def new
  end

  def create
    @party = current_user.parties.create(party_params)
    redirect_to @party
  end

  def show
    @party = Party.find(params[:id])
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
