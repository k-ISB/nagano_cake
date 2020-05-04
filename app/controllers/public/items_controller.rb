class Public::ItemsController < ApplicationController
  def top
    @num = Order.where("DATE(created_at) = '#{Date.today}'").count
    @items = Item.search(params[:search])
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @duplication = 0
    if current_end_user
      current_end_user.cart_items.each do |cart_item| 
        if cart_item.item == @item
          @duplication += 1
        end
      end
    end
 end
end
