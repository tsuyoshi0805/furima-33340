class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
       #@items = Item.all
  end

  def new
       @item = Item.new
  end
       def create
          @item = Item.new(item_params)
          if @item.save
             return redirect_to root_path #topページに戻る
          else
            render :new
          end
        end
  

  private

  def item_params
     params.require(:item).permit(:name,:price, :description, :category_id, :status_id, :shipping_cost_id, :shipping_day_id, :category_id, :image, :shipping_area_id).merge(user_id: current_user.id)
end
end
