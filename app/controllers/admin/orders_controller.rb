class Admin::OrdersController < ApplicationController
  def index
    @order = Order.page(params[:page])
  end
  def show
    @order_show = Order.find(params[:id])
  end
  def update
    @order_show = Order.find(params[:id])
      if @order_show.update(order_params)
        flash[:notice] = "更新しました"
        redirect_to request.referer
      else
        render "show"
      end
  end

  private

  def order_params
  params.require(:order).permit(:order_status)
  end

end