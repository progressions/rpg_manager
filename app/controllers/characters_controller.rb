class CharactersController < ApplicationController
  before_action :set_encounter
  before_action :set_character, only: [:show, :edit, :update, :destroy]
  before_action :requires_authentication

  # GET /characters
  # GET /characters.json
  def index
    @character = Character.new
    @characters = @encounter.characters.active
    @messages = @encounter.messages.order("created_at DESC")
  end

  # GET /characters/1
  # GET /characters/1.json
  def show
  end

  # GET /characters/new
  def new
    @character = @encounter.characters.new
  end

  # GET /characters/1/edit
  def edit
  end

  # POST /characters
  # POST /characters.json
  def create
    @character = @encounter.characters.new(character_params)
    @character.save!
  end

  # PATCH/PUT /characters/1
  # PATCH/PUT /characters/1.json
  def update
    if @character.update(character_params)
      render plain: "OK"
    end
  end

  # DELETE /characters/1
  # DELETE /characters/1.json
  def destroy
    @character.deactivate!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character
      @character = @encounter.characters.find(params[:id])
    end

    def set_encounter
      @encounter = Encounter.find(params[:encounter_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def character_params
      params.require(:character).permit(:name, :health, :active)
    end
end
