class Public::DeliveriesController < ApplicationController
  def index
    @deliveries = Delivery.all
  end

  def edit
     #@deliveries = Delivery.all
     @delivery = Delivery.find(params[:id])
  end

  def create
     @deliveries = Delivery.new(delivery_params)
     if @deliveries.save
      redirect_to edit_delivery_path(@deliveries)
     end
  end

  def update
    @deliveries = Delivery.find(params[:id])
    if @delivery.update(delivery_params)
      redirect_to delivery_path(@book.id)
    else
      render "edit"
    end
   
  end

  def destroy
    @deliveries = end_user.find_by(end_user_id: @deliveries.id)
    deliveries.destroy
    redirect_to request.referer
  end
end

 private

  def delivery_params
    params.require(:delivery).permit(:end_user_id, :post_code, :address, :delivery_name)
  end






