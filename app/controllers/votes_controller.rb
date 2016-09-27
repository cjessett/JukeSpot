class VotesController < ApplicationController
  def up
    juke_track = JukeTrack.find(params[:id])
    @party = Party.find(juke_track.party_id)

    vote = Vote.find_or_create_by(juke_track_id: juke_track.id, user_id: current_user.id)
    vote.update(value: 1)

    redirect_to @party
  end

  def down
    juke_track = JukeTrack.find(params[:id])
    @party = Party.find(juke_track.party_id)

    vote = Vote.find_or_create_by(juke_track_id: juke_track.id, user_id: current_user.id)
    vote.update(value: -1)

    redirect_to @party
  end
end
