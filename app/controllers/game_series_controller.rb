class GameSeriesController < ApplicationController
  def index
    @game_series = GameSeries.order(:name).page(params[:page]).per(20)
  end

  def show
    @game_series_show = GameSeries.find(params[:id])
    @amiibos = @game_series_show.amiibos.order(:name).page(params[:page]).per(8)
  end
end
