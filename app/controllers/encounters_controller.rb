class EncountersController < ApplicationController
  before_action :requires_authentication
  before_action :set_encounter, only: [:show, :edit, :update, :destroy]

  def index
    @encounters = current_user.encounters
  end

  def new
    @encounter = current_user.encounters.new
  end

  def create
    @encounter = current_user.encounters.new(encounter_params)
    @encounter.save!

    redirect_to encounters_path
  end

  def edit
  end

  def update
    if @encounter.update(encounter_params)
      redirect_to encounters_path
    end
  end

  def destroy
    @encounter.destroy
  end

  private

    def set_encounter
      @encounter = current_user.encounters.find(params[:id])
    end

    def encounter_params
      params.require(:encounter).permit(:name)
    end
end
