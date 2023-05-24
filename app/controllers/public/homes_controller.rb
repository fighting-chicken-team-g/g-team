class Public::HomesController < ApplicationController
  before_action :authenticate_end_user!, except: [:top, :about]

  def top
    @genres = Genre.all
  end

  def about
  end

end
