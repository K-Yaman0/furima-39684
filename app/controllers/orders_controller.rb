class OrdersController < ApplicationController

  def index
    if user_signed_in?
      @item = Item.find(params[:item_id])
    else
      redirect_to root_path
    end

    if user_signed_in? && current_user.id == @item.user.id
      redirect_to root_path
    end
  end

end
