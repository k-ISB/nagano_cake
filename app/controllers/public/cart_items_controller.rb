class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_end_user.cart_items
    @total = 0
    @cart_items.each do |cart_item| 
      tal = cart_item.item.non_taxed_price * cart_item.amount
      @total += tal
    end
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to root_path
  end

  def destroy_all
    CartItem.destroy_all
    flash[:notice] = "全部消しただなも"
    redirect_to root_path
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.end_user_id = current_end_user.id
    #@cart_item.item_id = params[:id]
    @cart_item.save
    redirect_to cart_items_path
  end

  private
  
  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id)
  end
end
