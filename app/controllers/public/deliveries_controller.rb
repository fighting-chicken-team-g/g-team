class Public::DeliveriesController < ApplicationController
  def index
    @deliveries = current_end_user.deliveries
    @delivery = Delivery.new
  end

  def edit
     #@deliveries = Delivery.all
     @delivery = Delivery.find(params[:id])
  end

  def create
     @deliveries = Delivery.new(delivery_params)
     @deliveries.end_user_id = current_end_user.id
     if @deliveries.save
       redirect_to deliveries_path
     else
       redirect_to request.referer
     end
  end

  def update
    @deliveries = Delivery.find(params[:id])
    if @deliveries.update(delivery_params)
      redirect_to deliveries_path
    else
      render "edit"
    end

  end

  def destroy
    @deliveries = Delivery.find(params[:id])
    @deliveries.destroy
    redirect_to request.referer
  end
end

 private

  def delivery_params
    params.require(:delivery).permit(:end_user_id, :post_code, :address, :delivery_name)
  end






