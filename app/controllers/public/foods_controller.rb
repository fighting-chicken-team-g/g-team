class Public::FoodsController < ApplicationController
  def index
    @genre = Genre.all
  end

  def show
  end
end

