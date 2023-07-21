class OrdersController < ApplicationController
  before_action :authenticate_user!, expect: :index


  def index
    @item = Item.find(params[:item_id])
    @order_add = OrderAdd.new
  end

  
  def create
    @item = Item.find(params[:item_id])
    @order_add = OrderAdd.new(order_params)

    if @order_add.valid?
      @order_add.save
      redirect_to root_path
    else
      render :index
    end

  end




  

  private

  def order_params
     params.require(:order_add).permit(:post, :prefecture_id, :city, :address, :build, :tell).merge(user_id: current_user.id, item_id: @item.id)
  end

  

end
