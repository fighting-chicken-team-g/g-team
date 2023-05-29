class Admin::OrdersController < ApplicationController

  before_action :authenticate_admin!
  def index
    @order = Order.page(params[:page])
  end

  #def index
    #@order = Order.page(params[:page])
  #end

  def show
    @order_show = Order.find(params[:id])
  end
  def update
    @order_show = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
      if @order_show.update(order_params)
         @order_details.update_all(production_status: "production_wait") if @order_show.order_status == "check_pay"
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