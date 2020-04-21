class Public::OrdersController < ApplicationController
  def new
    @addresses = Address.all
    @ordered = Order.all
  end

  def verification
    @cart_items = current_end_user.cart_items
  end

  def create
    session[:user] = Order.new()

    #支払い方法のセッション情報
    if params[:payment_select] == "0"
      session[:user][:payment_method] = 0
    elsif params[:payment_select] == "1"
      session[:user][:payment_method] = 1
    end
    
    #配送先登録のセッション情報
    if params[:address_select] == "0"
      session[:user][:postal_code] = current_end_user.postal_code
      session[:user][:shipping_address] = current_end_user.address
      session[:user][:direction] = current_end_user.full_name
    elsif params[:address_select] == "1"
      session[:user][:postal_code] =  Address.find(params[:address_id]).postal_code
      session[:user][:shipping_address] = Address.find(params[:address_id]).shipping_address
      session[:user][:direction] = Address.find(params[:address_id]).direction
    else 
      session[:user][:postal_code] =  params[:postal_code]
      session[:user][:shipping_address] = params[:shipping_address]
      session[:user][:direction] = params[:direction]
    end
    redirect_to orders_verification_path
    
   end

   def complete
    order = Order.new(session[:user])
    order.postage = 500
    order.payment = 1000
    order.status = 1
    order.end_user_id = current_end_user.id
    order.save
    cart_items = current_end_user.cart_items
    cart_items.each do |cart_item|
      ordered_item = OrderedItem.new
      ordered_item.item_id = cart_item.item.id
      ordered_item.production_status = 0
      ordered_item.unit_price = cart_item.item.non_taxed_price
      ordered_item.quantity = cart_item.amount
      ordered_item.order_id = order.id
      ordered_item.save
    end
    cart_items.destroy_all
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:direction, 
                                  :postal_code, 
                                  :shipping_address, 
                                  :payment_method)
  end
end
