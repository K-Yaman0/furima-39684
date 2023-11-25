class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :update, :destroy, :show]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    return if user_signed_in? && current_user.id == @item.user.id && !@item.order.present?

    redirect_to action: :index
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @item.user != current_user
      redirect_to root_path
    else
      @item.destroy
    end
    redirect_to root_path
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :description, :category_id, :item_condition_id, :freight_id, :prefecture_id,
                                 :ship_date_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
