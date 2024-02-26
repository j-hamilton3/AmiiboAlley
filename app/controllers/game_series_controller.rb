class GameSeriesController < ApplicationController
  def index
    @game_series = GameSeries.all
  end

  def show
    @game_series_show = GameSeries.find(params[:id])
  end
end
