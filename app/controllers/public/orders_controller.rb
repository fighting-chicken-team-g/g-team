class Public::OrdersController < ApplicationController
  #before_action :authenticate_customer!

  def index

    @orders = Order.all
  end

  def show
    #@orders = current_end_user.orders.find(params[:id])
  end

  def new
    @order = Order.new
    @orders = current_end_user.orders
    #@client = Client.find(current_end_user.id)
    @deliveries = current_end_user.deliveries
  end

  def confirm
    @cart_foods = current_end_user.cart_ids
    @total = 0
    @order = Order.new(order_params)
    #@order.is_order = 0    #注文のステータスが0#
    @delivery_price = 800 #送料円#
    @total_price = Total_price
    if params[:order][:select_address] == "0"
            @order.post_code = current_end_user.post_code
            @order.address = current_end_user.address
            @order.name = current_end_user.last_name + current_end_user.first_name
        elsif params[:order][:select_address] == "1"
            @address = Address.find(params[:order][:address_id])
    　　      @order.post_code = @address.post_code
            @order.address = @address.address
            @order.name = @address.name
        else params[:order][:select_address] == "2"
            
    end
  end

  def completed
  end

  def create
    @order = Order.new(order_params)
    @deliveries_price = 800
    @order.is_order = 0
    @order.save
    @cart_foods = current_end_user.cart_foods
    @cart_foods.each do |cart_food|
    @order_detail = OrderDetail.new
    @order_detail.order_id = @order.id
    @order_detail.food_id = cart_food.food_id
    @order_detail.tax_free_price = cart_food.tax_free_price
    @order_detail.tax_free_price = cart_food.subtotal
    @order_detail.is_making = 0
    @order_detail.save
    end
    current_customer.cart_items.destroy_all
    redirect_to orders_confirm_path
  end


private

  def order_params
    params.require(:order).permit(:payment, :address, :total_price, :post_code, :end_user_id, :delivery_price, :confirm, :name)
  end
end