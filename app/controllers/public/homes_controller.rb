class Public::HomesController < ApplicationController
  before_action :authenticate_end_user!, except: [:top, :about]

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
