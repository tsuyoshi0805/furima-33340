class OrdersController < ApplicationController
  def index
    @orderaddress = OrderAddress.new
  end
end
