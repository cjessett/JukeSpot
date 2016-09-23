class MembershipsController < ApplicationController
  skip_before_action :require_login

  def new
    @party = Party.find_by_invite_link params[:invite_link]
  end

  def create
    Membership.find_or_create_by(user_id: current_user.id, party_id: params[:id])
    redirect_to party_path params[:id]
  end
end
