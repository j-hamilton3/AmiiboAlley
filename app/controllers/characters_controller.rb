class CharactersController < ApplicationController
  def index
    @characters = Character.order(:name).page(params[:page]).per(20)
  end

  def show
    @character = Character.find(params[:id])
    @amiibos = @character.amiibos.order(:name).page(params[:page]).per(8)
  end
end
