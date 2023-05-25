class Public::FoodsController < ApplicationController
  before_action :authenticate_end_user!, except: [:show, :index]

  def index
    @genre = Genre.all
    @foods = Food.all
    #@foods = Food.page(params[:page])
  end

  def show
    @cart_new = Cart.new
    @food = Food.find(params[:id])
    @genres = Genre.all
    @genre = @food.genre
  end
end

