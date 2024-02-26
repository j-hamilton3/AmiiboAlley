class AmiiboSeriesController < ApplicationController
  def index
    @amiibo_series = AmiiboSeries.all
  end

  def show
    @amiibo_series_show = AmiiboSeries.find(params[:id])
  end
end
