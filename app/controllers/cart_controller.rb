class CartController < ApplicationController
  def create
    logger.debug("adding: #{params[:id]}")
    id = params[:id].to_i
    session[:shopping_cart] << id unless session[:shopping_cart].include?(id)
    amiibo = Amiibo.find(id)
    flash[:notice] = "#{amiibo.name} was added to the cart. 🛒"
    redirect_to root_path
  end

  def destroy

  end
end
