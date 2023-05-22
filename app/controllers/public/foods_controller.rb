class Public::FoodsController < ApplicationController
  def index
    @genre = Genre.all
    @foods = Food.all
    #@foods = Food.page(params[:page])
  end

  def show
    @carts = Cart.all
    @food = Food.all
  end
end

