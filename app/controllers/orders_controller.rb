class OrdersController < ApplicationController
  def index
    @orderaddress = OrderAddress.new
    @item = Item.find(params[:item_id])
  end
    def create
      @orderaddress = OrderAddress.new(orderaddress_params)
      @item = Item.find(params[:item_id])
      if @orderaddress.valid?
        pay_item
        
      @orderaddress.save
      redirect_to root_path
    else
      render action: :index
    end
    end
  

  
    private
    def orderaddress_params
      params.require(:order_address).permit(:name, :post_code, :shipping_area_id, :city, :address, :building_name, :phone_number, :order_id).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
    end
    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: orderaddress_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
end

