class ItemsController < ApplicationController
   

  def index

  end

  def new
     unless user_signed_in?
        redirect_to action: :index
     end
  end
    


  
  
end
