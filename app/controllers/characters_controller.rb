class CharactersController < ApplicationController
  before_filter :set_character, only: [:edit, :create, :update, :destroy]

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

    def set_character
      @character = Character.find(params[:id])
    end
end
