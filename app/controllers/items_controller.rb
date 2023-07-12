class ItemsController < ApplicationController
   

  def index

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


  private
    
    def item_params
     params.require(:item).permit(:name,:explanation,:image,:category_id,:price).merge(user_id: current_user.id)
      end

end
  

