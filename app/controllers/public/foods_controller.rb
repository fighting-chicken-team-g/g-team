class Public::FoodsController < ApplicationController
  def index
    @genre = Genre.all
    @foods = Food.all
    #@foods = Food.page(params[:page])
  end

  def show
    @cart_new = Cart.new
    @food = Food.find(params[:id])
  end
end

