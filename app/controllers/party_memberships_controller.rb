class PartyMembershipsController < ApplicationController
  before_action :requires_authentication

  def index
    @encounters = Encounter.where.not(encounters: { user_id: current_user })
  end

  def new
    @encounter = Encounter.find(party_membership_params[:encounter_id])
    @party_membership = current_user.party_memberships.new(party_membership_params)
  end

  def create
    @encounter = Encounter.find(party_membership_params[:encounter_id])
    if @encounter.private?
      flash[:alert] = "You cannot join this encounter."
      redirect :back
    else
      @party_membership = current_user.party_memberships.new(party_membership_params)
      @party_membership.save!
      flash[:notice] = "You have successfully joined '#{@encounter.name}'."
      redirect_to encounter_characters_path(encounter_id: @party_membership.encounter)
    end
  end

  def destroy
    @party_membership = current_user.party_memberships.find(params[:id])
    @party_membership.destroy!

    flash[:notice] = "You have successfully left '#{@party_membership.encounter.name}'."

    redirect_to party_memberships_path
  end

  private

    def party_membership_params
      params.require(:party_membership).permit(:encounter_id)
    end
end
