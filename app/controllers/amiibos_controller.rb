class AmiibosController < ApplicationController
  def index
    @amiibos = Amiibo.order(:name).page(params[:page]).per(8)
  end

  def show
    @amiibo = Amiibo.find(params[:id])
  end

  def search
    wildcard_search = "%#{params[:keywords]}%"
    if params[:amiibo_series_id].present? && params[:amiibo_series_id] != ''
      # Search within a specific Amiibo series
      @amiibos = Amiibo.joins(:amiibo_series)
                        .where("amiibo_series.id = ? AND amiibos.name LIKE ?",
                                params[:amiibo_series_id], wildcard_search)
                                .page(params[:page])
                                .per(8)
      @category = AmiiboSeries.find(params[:amiibo_series_id]).name
    else
      # Search across all Amiibos
      @amiibos = Amiibo.where("name LIKE ?", wildcard_search).page(params[:page]).per(8)
      @category = "All Amiibos"
    end
  end
end
