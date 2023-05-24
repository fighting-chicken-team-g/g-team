class Admin::OrdersController < ApplicationController
  def index
    @order = Order.page(params[:page])
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
  end
  
end