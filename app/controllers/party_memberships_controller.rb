class PartyMembershipsController < ApplicationController
  before_action :requires_authentication

  def index
    @encounters = Encounter.available(current_user)
  end

  def new
    @encounter = Encounter.find(party_membership_params[:encounter_id])
    @party_membership = current_user.party_memberships.new(party_membership_params)
  end

  def create
    @party_membership = current_user.party_memberships.new(party_membership_params)
    @party_membership.save!

    redirect_to encounter_characters_path(encounter_id: @party_membership.encounter)
  end

  private

    def party_membership_params
      params.require(:party_membership).permit(:encounter_id)
    end
end
