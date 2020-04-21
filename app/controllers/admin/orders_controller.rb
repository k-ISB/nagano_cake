class Admin::OrdersController < ApplicationController
  def update
    @ordered_item = OrderedItem.find(params[:id])
    ordered_item.update(ordered_item_params)
    redirect_to admin_order_path(ordered_item)
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
    #送料

    #合計
  end

  private

  def ordered_item_params
    params.require(:ordered_item).permit(:production_status)
  end
end
