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
    id = params[:id].to_i
    session[:shopping_cart].delete(id)
    amiibo = Amiibo.find(id)
    flash[:notice] = "#{amiibo.name} was removed from the cart. ❌"
    redirect_to root_path
  end
end
