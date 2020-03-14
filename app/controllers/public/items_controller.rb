class Public::ItemsController < ApplicationController
  def top
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
 end
end
