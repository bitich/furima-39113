class ItemsController < ApplicationController
   before_action :authenticate_user!,except:[:index, :new, :show]
   before_action :set_item, only: [:edit,:show,:update]
   before_action :move_to_index, only: [:edit]
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

  def destroy

     item = Item.find(params[:id])
     if user_signed_in? && current_user.id == item.user_id 
     item.destroy
    redirect_to action: :index
   end
  end
  
  def show
     
  end

  def edit
     
     #if @item.item_add.blank?
      if current_user.id == @item.user.id 
        render :edit
     else
        redirect_to action: :index
     end
     #end
  end

  def update
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
     
      def set_item
         @item = Item.find(params[:id])
      end

      def move_to_index
         unless user_signed_in? && current_user.id == @item.user.id
            redirect_to action: :index
         end
      end
end

  

