class ItemsController < ApplicationController
   

  def index
   @item = Item.order("created_at DESC")
  end

  def new
     unless user_signed_in?
        redirect_to action: :index
     end

     @item = Item.new

  end

  def create
     @item = Item.new(item_params)
    if @item.save
        redirect_to root_path
    else
        render :new
    end
  end

  def destory
    item = Item.find(params[:id])
    item.destroy
  end
  
  def show
     @item = Item.find(params[:id])
  end

  private
    
    def item_params
     params.require(:item).permit(:name,:explanation,:image,:category_id,:price,:condition_id,:postage_id,:prefecture_id,
                                  :shipment_id).merge(user_id: current_user.id)
      end
     
end
  

