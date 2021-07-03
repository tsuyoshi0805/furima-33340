class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :sold_out_item, only: [:index]
  def index
    @orderaddress = OrderAddress.new
    if @item.user.id == current_user.id
      redirect_to root_path
    end
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
      params.require(:order_address).permit(:name, :post_code, :shipping_area_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
    end
    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: orderaddress_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
  def sold_out_item
    @item = Item.find(params[:item_id])
   
    if @item.order.present?
    
    redirect_to root_path 
end
end
end