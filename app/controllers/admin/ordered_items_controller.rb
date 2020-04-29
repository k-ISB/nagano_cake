class Admin::OrderedItemsController < ApplicationController

    def update
        ordered_item = OrderedItem.find(params[:ordered_item][:ordered_item_id])
        order = ordered_item.order

        #注文商品の製作ステータスが1つでも“製作中“で注文ステータスを“製作中“に更新
        if params[:ordered_item][:production_status] == "c"
          order.update(status: "c")
        end
        ordered_item.update(production_status: params[:ordered_item][:production_status])

        #注文商品全ての製作ステータスが“製作完了“で注文ステータスを“発送準備中“に
        status = 0
        order = Order.find(params[:id])
        order.ordered_items.each do |ordered_item| 
          if ordered_item.production_status != "d"
            status = 1
          end
        end
        if status == 0
          order.update(status: "d")
        end
        redirect_to admin_orders_path
    end
end
