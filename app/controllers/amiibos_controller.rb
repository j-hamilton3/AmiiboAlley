class AmiibosController < ApplicationController
  def index
    @amiibos = Amiibo.order(:name)
  end

  def show
    @amiibo = Amiibo.find(params[:id])
  end

  def search
    wildcard_search = "%#{params[:keywords]}%"
    @amiibos = Amiibo.where("name LIKE ?", wildcard_search)
  end
end
