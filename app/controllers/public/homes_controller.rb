class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all
    @genre = Genre.new
    @foods = Food
    @foods = Food.all
    #@food = Food.find(params[:id])
  end

  def about
  end

end
