class AmiibosController < ApplicationController
  def index
    @amiibos = Amiibo.all
  end

  def show
    @amiibo = Amiibo.find(params[:id])
  end
end
