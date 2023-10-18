class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def item_params
    params.rwquire(:item).permit(:image, :item_name, :description, :category_id, :item_condition_id, :freight_id, :prefecture_id, :ship_date_id, :price)
  end
end
