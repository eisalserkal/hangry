class WaitersController < ApplicationController
  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @waiters = Waiter.where(restaurant: params[:restaurant_id])
  end

  def show
    @waiter = Waiter.find(params[:id])
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @waiter = Waiter.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @waiter = Waiter.new(waiter_params)
    @waiter.restaurant = @restaurant
    if @waiter.save
      redirect_to restaurant_waiter_path(@restaurant, @waiter)
    else
      render :new
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:restaurant_id])
    @waiter = Waiter.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:restaurant_id])
    @waiter = Waiter.find(params[:id])
    @waiter.update(waiter_params)
    redirect_to restaurant_waiter_path(@restaurant, @waiter)
  end

  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    @waiter = Waiter.find(params[:id])
    @waiter.destroy
    redirect_to restaurant_waiters_path(@restaurant)
    end

  private

  def waiter_params
    params.require(:waiter).permit(:name)
  end
end
