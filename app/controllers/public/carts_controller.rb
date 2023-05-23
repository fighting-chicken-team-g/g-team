class Public::CartsController < ApplicationController
  def create
    @cart = Cart.new(cart_params)
    @cart.end_user_id = current_end_user.id
    @carts =current_end_user.carts.all
    @carts.each do |cart|
      if cart.food_id == @cart.food_id
        new_order_count = cart.order_count + @cart.order_count
        cart.update_attribute(:order_count, new_order_count)
        @cart.delete
      end
    end
    @cart.save
    redirect_to carts_path
  end

  def index
    @carts = current_end_user.carts.all
    @total = @carts.inject(0) { |sum, food| sum + food.sum_of_price }
  end

  def update
    @cart = Cart.find(params[:id])
    if @cart.update(cart_params)
      redirect_to request.referer
    else
      render "index"
    end
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    redirect_to request.referer
  end

  def destroy_all
    Cart.destroy_all
    current_end_user.carts.destroy_all
    redirect_to request.referer
  end

  private

  def cart_params
    params.require(:cart).permit(:end_user_id, :food_id, :order_count)
  end
end
