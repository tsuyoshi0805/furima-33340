class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :unless_item, only: [:edit, :update, :destroy]


  def index
    
     @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path # topページに戻る
    else
      render :new
    end
  end

  def show
     
  end
 
  def edit

  end
  def update
      
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
  end
end
  def destroy
    
  if  @item.destroy
    redirect_to root_path
   else
    render :show
end
end
    private

  def item_params
    params.require(:item).permit(:name, :price, :description, :category_id, :status_id, :shipping_cost_id, :shipping_day_id,
                                 :category_id, :image, :shipping_area_id).merge(user_id: current_user.id)              
  end
  def set_item
    @item = Item.find(params[:id])
  end
def unless_item
  unless @item.user.id == current_user.id
    redirect_to root_path
end
end

end
