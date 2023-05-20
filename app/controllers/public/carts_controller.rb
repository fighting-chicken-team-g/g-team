class Public::CartsController < ApplicationController
  def index
  end

  def destroy_all
    user = User.find(params[:id])
    user.carts.destroy_all
    Cart.destroy_all
    redirect_to carts_path
  end
end
