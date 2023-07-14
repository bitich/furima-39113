class ItemsController < ApplicationController
   before_action :authenticate_user!,except:[:index, :new, :show]
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

  #def destory
    #item = Item.find(params[:id])
    #item.destroy
  #end
  
  def show
     @item = Item.find(params[:id])
  end

  def edit
     @item = Item.find(params[:id])
     if @item_add.blank?
      if current_user.id == @item.user.id 
        render :edit
     else
        render :index
     end
     end
  end

  def update
      @item = Item.find(params[:id])
         if @item.update(item_params)
            redirect_to item_path(@item.id)
         else
            render :edit 
         end
   end 

  private
    
    def item_params
     params.require(:item).permit(:name,:explanation,:image,:category_id,:price,:condition_id,:postage_id,:prefecture_id,
                                  :shipment_id).merge(user_id: current_user.id)
      end
     
end
  

