class Admin::OrdersController < ApplicationController
  def update
    order = Order.find(params[:id])
    order.update(order_params)
    redirect_to admin_order_path(order)
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @ordered_item = @order.ordered_items
    #商品合計
    @total = 0
    @ordered_item.each do |ordered_item|
      tol = ordered_item.item.non_taxed_price * ordered_item.quantity
      @total += tol 
    end
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end
end
