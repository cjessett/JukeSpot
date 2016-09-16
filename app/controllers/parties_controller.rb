class PartiesController < ApplicationController
  def new
  end

  def create
    @party = current_user.parties.create(party_params)
    @party.save
    redirect_to @party
  end

  def show
    @party = Party.find(params[:id])
  end

  private
  def party_params
    params.required(:party).permit(:name, :threshold)
  end
end
