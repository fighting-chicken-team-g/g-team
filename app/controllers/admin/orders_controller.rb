class Admin::OrdersController < ApplicationController
  def index
    @order = Order.all(order_params)
  end
  def show
    @order_show = Order.find(params[:id])
  end
  def update
    @order_show = Order.find(params[:id])
    if @food.update(food_params)
      redirect_to admin_foods_path
    else
      render "edit"
    end
  end
  
  private

  def order_params
    params.require(:order).permit(:created_at, :name, :order_status)
  end
  
end