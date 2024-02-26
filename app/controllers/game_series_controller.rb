class GameSeriesController < ApplicationController
  def index
    @game_series = GameSeries.order(:name)
  end

  def show
    @game_series_show = GameSeries.find(params[:id])
  end
end
