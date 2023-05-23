class Public::CartsController < ApplicationController
  def create
  end

  def index
    @carts = current_end_user.carts.all
    @total_price = @carts.inject(0) { |sum, food| sum + food.sum_of_price }
  end

  def update
  end

  def destroy
  end

  def destroy_all
    carts = Cart.all
    carts.destroy_all
    render 'index'
  end

  private

  def cart_params
    params.require(:cart).permit(:end_user_id, :food_id, :order_count)
  end
end
