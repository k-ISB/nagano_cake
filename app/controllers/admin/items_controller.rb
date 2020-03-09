class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.update(item_params)
      #flash[:success] = "メールアドレスを更新しました"
      redirect_to admin_items_path
    else
      render :new
    end
  end

  def show
  end

  def exit
  end

  def update
  end
  
  private

  def item_params
    params.require(:item).permit(:name, :genre_id, :non_taxed_price, :sales_status)
  end
end
