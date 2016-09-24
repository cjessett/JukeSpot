class VotesController < ApplicationController
  def up
    juke_track = JukeTrack.find(params[:id])
    @party = Party.find(juke_track.party_id)

    voter_id = current_user.id
    spotify_user = RSpotify::User.new @party.playlist_owner_id

    vote = Vote.find_or_create_by(juke_track_id: juke_track.id, user_id: voter_id)
    vote.update(value: 1)

    spotify_user = RSpotify::User.new session[:spotify]
    redirect_to @party
  end

  def down
    juke_track = JukeTrack.find(params[:id])
    @party = Party.find(juke_track.party_id)

    voter_id = current_user.id
    spotify_user = RSpotify::User.new @party.playlist_owner_id

    vote = Vote.find_or_create_by(juke_track_id: juke_track.id, user_id: voter_id)
    vote.update(value: -1)

    spotify_user = RSpotify::User.new session[:spotify]
    redirect_to @party
  end
end
