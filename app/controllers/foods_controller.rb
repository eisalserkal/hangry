class FoodsController < ApplicationController
  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @foods = Food.where(restaurant: params[:restaurant_id])
  end

  def show
    @food = Food.find(params[:id])
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @food = Food.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @food = Food.new(food_params)
    @food.restaurant = @restaurant
    if @food.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:restaurant_id])
    @food = Food.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:restaurant_id])
    @food = Food.find(params[:id])
    @food.update(food_params)
    redirect_to dashboard_path
  end

  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to dashboard_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :price, :description, :category, :photo)
  end
end
