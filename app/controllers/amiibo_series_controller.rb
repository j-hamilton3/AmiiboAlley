class AmiiboSeriesController < ApplicationController
  def index
    @amiibo_series = AmiiboSeries.order(:name)
  end

  def show
    @amiibo_series_show = AmiiboSeries.find(params[:id])
    @amiibos = @amiibo_series_show.amiibos.order(:name).page(params[:page]).per(8)
  end
end
