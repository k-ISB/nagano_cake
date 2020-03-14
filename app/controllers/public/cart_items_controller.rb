class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
  end

  def update
  end

  def destroy
    book = CartItem.find(params[:id])
  	book.destroy
  end

  def destroy_all
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.end_user_id = current_end_user.id
    #@cart_item.item_id = params[:id]
    @cart_item.save!
    redirect_to cart_items_path
  end

  private
  
  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id)
  end
end
