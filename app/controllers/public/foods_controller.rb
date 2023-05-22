class Public::FoodsController < ApplicationController
  def index
    @genre = Genre.all
    @foods = Food.all
  end

  def show
    @carts = Cart.all
    @food = Food.all
  end
end

