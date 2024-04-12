class CartController < ApplicationController
  def create
    logger.debug("adding: #{params[:id]}")
    id = params[:id].to_i
    session[:shopping_cart] << id
    redirect_to root_path
  end

  def destroy

  end
end
