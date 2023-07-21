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
      pay_item
      @order_add.save
      redirect_to root_path
    else
      render :index
    end

  end




  

  private

  def order_params
     params.require(:order_add).permit(:post, :prefecture_id, :city, :address, :build, :tell).merge(user_id: current_user.id, item_id: @item.id,token: params[:token])
  end

  def pay_item
      Payjp.api_key = "sk_test_28b4b33645e6bf7db0b1b896"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
  

end
