class EncountersController < ApplicationController
  before_action :set_encounter, only: [:show, :edit, :update, :destroy]

  def index
    @encounters = Encounter.all
  end

  def new
    @encounter = Encounter.new
  end

  def create
    @encounter = Encounter.new(encounter_params)
    @encounter.save!

    redirect_to encounters_path
  end

  def edit
  end

  def update
    if @encounter.update(encounter_params)
      render text: "OK"
    end
  end

  def destroy
    @encounter.destroy
  end

  private

    def set_encounter
      @encounter = Encounter.find(params[:id])
    end

    def encounter_params
      params.require(:encounter).permit(:name)
    end
end
