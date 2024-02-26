class AmiibosController < ApplicationController
  def index
    @amiibos = Amiibo.order(:name)
  end

  def show
    @amiibo = Amiibo.find(params[:id])
  end
end
