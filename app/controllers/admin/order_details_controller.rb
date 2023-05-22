class Admin::OrderDetailsController < ApplicationController
  def update
      @order_show = Order.find(params[:id])
  if @food.update(food_params)
    redirect_to admin_foods_path
  else
    render "edit"
  end

  end
end
