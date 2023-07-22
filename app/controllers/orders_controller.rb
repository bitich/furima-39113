class OrdersController < ApplicationController
  before_action :authenticate_user!, expect: :index
  before_action :item_find, only: [:index,:create]

  def index
   if  current_user.id == @item.user.id 
    redirect_to root_path
   else
   if @item.order.present?
    redirect_to root_path
   end
  end
    
    @order_add = OrderAdd.new
  end

  
  def create
   
    @order_add = OrderAdd.new(order_params)


    if @order_add.valid?
      pay_item
      @order_add.save
      redirect_to root_path
    else
      render :index
    end

  end




  

  private

  def item_find
    @item = Item.find(params[:item_id])
  end

  def order_params
     params.require(:order_add).permit(:post, :prefecture_id, :city, :address, :build, :tell).merge(user_id: current_user.id, item_id: @item.id,token: params[:token])
  end

  def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
  

end
