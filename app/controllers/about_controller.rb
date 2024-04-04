class AboutController < ApplicationController
  def index
    @amiibos = Amiibo.all
  end
end
