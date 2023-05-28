class Public::OrdersController < ApplicationController
  before_action :authenticate_end_user!
  def index
    @orders = current_end_user.orders.all
  end

  def show
    @order = current_end_user.orders.find(params[:id])
     @order_details = @order.order_details
     @total = 0
     @order.order_details.each do |order_detail|
     @total += order_detail.sum_of_price
    end
  end

  def new
    @order = Order.new
    @deliveries = current_end_user.deliveries
    @orders = current_end_user.orders
    #@client = Client.find(current_end_user.id)
  end

  def confirm
    @carts = current_end_user.carts.all
    @order = Order.new(order_params)
    #@order.payment = 0
    @order.delivery_price = 800 # 送料円 #
    @total = 0
    @carts.each do |cart|
      @total += cart.sum_of_price
    end
    #@total_price = Total_price
    if params[:order][:select_address] == "0"
       @order.post_code = current_end_user.post_code
       @order.address = current_end_user.address
       @order.name = current_end_user.last_name + current_end_user.first_name
    elsif params[:order][:select_address] == "1"
       @address = Delivery.find(params[:order][:address_id])
       @order.post_code = @address.post_code
       @order.address = @address.address
      # @order.name = current_end_user.last_name + current_end_user.first_name
    else
      params[:order][:select_address] == "2"
    end
  end

  def completed
  end

  def create
    @order = Order.new(order_params)
    @delivery_price = 800
    @order.order_status = 0
    @order.save
    @carts = current_end_user.carts
    @carts.each do |cart|
      @order_detail = OrderDetail.new
      @order_detail.order_id = @order.id
      @order_detail.food_id = cart.food_id #cart.food.add_tax_sales_price
      @order_detail.tax_price = cart.food.add_tax_sales_price#(cart.food.tax_free_price * 1.1).round
     # @order_detail.tax_price = cart.sum_of_price
      @order_detail.production_status = 0
      @order_detail.order_detail_count = cart.order_count
      @order_detail.save
    end
    current_end_user.carts.destroy_all
    redirect_to orders_completed_path
  end

private

  def order_params
    params.require(:order).permit(:payment, :address, :total_price, :post_code, :end_user_id, :delivery_price, :confirm, :name)
  end
end