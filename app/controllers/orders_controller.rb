class OrdersController < ApplicationController
  def index
    @orderaddress = OrderAddress.new
    @item = Item.find(params[:item_id])
  end
    def create
      @orderaddress = OrderAddress.new(orderaddress_params)
      @item = Item.find(params[:item_id])
      if @orderaddress.valid?
      @orderaddress.save
      redirect_to action: :index
    else
      render action: :index
    end
    end
  

  
    private
    def orderaddress_params
      params.require(:order_address).permit(:name, :post_code, :shipping_area_id, :city, :address, :building_name, :phone_number, :order_id )
    end
  end
