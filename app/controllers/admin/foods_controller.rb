class Admin::FoodsController < ApplicationController

  def new
  @food = Food.new
  end

  def index
    @foods = Food.page(params[:page])
  end

  def create
    @food = Food.new(food_params)
      if @food.save
        redirect_to admin_food_path(@food)
      else
        render :new
      end
  end

  def show
    @food_show = Food.find(params[:id])
  end

  def edit
    @food = Food.new
    @food_edit = Food.find(params[:id])


  end
  def update
    @food =Food.find(params[:id])
    if @food.update(food_params)
      redirect_to admin_foods_path
    else
      render "edit"
    end
  end

  private

  def food_params
    params.require(:food).permit(:food_image, :food_name, :introduction, :genre_id, :tax_free_price, :sales_status)
  end
end
